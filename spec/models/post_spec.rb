require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:concept_post) { create(:post, :concept) }
  let(:published_post) { create(:post, :published) }

  context 'scopes' do
    describe 'concept' do
      it 'should include concept posts' do
        expect(Post.concept).to include(concept_post)
      end

      it 'should exclude published posts' do
        expect(Post.concept).to_not include(published_post)
      end
    end

    describe 'published' do
      it 'should exclude concept posts' do
        expect(Post.published).to_not include(concept_post)
      end

      it 'should include published posts' do
        expect(Post.published).to include(published_post)
      end
    end
  end

  context '.' do
    context 'page' do
      describe 'index_meta' do
        subject { Post.page.index_meta }

        it 'should contain meta keys' do
          expect(subject.keys).to eq([:filters, :page, :count, :total_count])
        end

        it 'should use class wide filters as filters' do
          expect(subject[:filters]).to eq(Post.filters)
        end

        it 'should return total amount of posts for total_count' do
          create_list(:post, rand(1...3))
          expect(subject[:total_count]).to eq(Post.count)
        end

        it 'should have page set to filters.page.default' do
          expect(subject[:page]).to eq(subject[:filters][:page][:default])
        end

        it 'should have count set to filters.count.default' do
          expect(subject[:count]).to eq(subject[:filters][:count][:default])
        end
      end
    end

    describe 'filters' do
      subject { Post.filters }

      it 'should contain possible filter keys' do
        expect(subject.keys).to eq([:page, :count])
      end

      it 'should have a default page of 1' do
        expect(subject[:page][:default]).to eq(1)
      end

      it 'should have a min page of 1' do
        expect(subject[:page][:min]).to eq(1)
      end

      it 'should use class wide default for count' do
        expect(subject[:count][:default]).to eq(Post::DEFAULT_COUNT)
      end

      it 'should use class wide max for count' do
        expect(subject[:count][:max]).to eq(Post::MAX_COUNT)
      end
    end
  end

  context '#' do
    describe 'unpublish' do
      it 'changes published posts state to concept' do
        expect { published_post.unpublish }.to change { published_post.state }.to('concept')
      end

      it 'throws an error on concept posts' do
        expect { concept_post.unpublish }.to raise_error
      end
    end

    describe 'publish' do
      it 'changes concept posts state to published' do
        expect { concept_post.publish }.to change { concept_post.state }.to('published')
      end

      it 'throws an error on already published posts' do
        expect { published_post.publish }.to raise_error
      end
    end
  end
end
