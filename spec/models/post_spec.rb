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
      end
    end

    describe 'filters' do
      subject { Post.filters }

      it 'should contain possible filter keys' do
        expect(subject.keys).to eq([:page, :count])
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
