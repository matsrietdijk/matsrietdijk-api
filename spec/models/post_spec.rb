require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:concept_post) { create(:post, :concept) }
  let(:published_post) { create(:post, :published) }

  context 'scopes' do
    describe 'concept' do
      it 'includes concept posts' do
        expect(described_class.concept).to include(concept_post)
      end

      it 'excludes published posts' do
        expect(described_class.concept).to_not include(published_post)
      end
    end

    describe 'published' do
      it 'excludes concept posts' do
        expect(described_class.published).to_not include(concept_post)
      end

      it 'includes published posts' do
        expect(described_class.published).to include(published_post)
      end
    end
  end

  context '.' do
    context 'page' do
      describe 'index_meta' do
        subject { described_class.page.index_meta }

        it 'contains meta keys' do
          expect(subject.keys).to eq([:filters, :page, :count, :total_count])
        end

        it 'uses class wide filters as filters' do
          expect(subject[:filters]).to eq(described_class.filters)
        end

        it 'returns total amount of posts for total_count' do
          create_list(:post, rand(1...3))
          expect(subject[:total_count]).to eq(described_class.count)
        end

        it 'has page set to filters.page.default' do
          expect(subject[:page]).to eq(subject[:filters][:page][:default])
        end

        it 'has count set to filters.count.default' do
          expect(subject[:count]).to eq(subject[:filters][:count][:default])
        end
      end
    end

    describe 'filters' do
      subject { described_class.filters }

      it 'contains possible filter keys' do
        expect(subject.keys).to eq([:page, :count])
      end

      it 'has a default page of 1' do
        expect(subject[:page][:default]).to eq(1)
      end

      it 'has a min page of 1' do
        expect(subject[:page][:min]).to eq(1)
      end

      it 'uses class wide default for count' do
        expect(subject[:count][:default]).to eq(described_class::DEFAULT_COUNT)
      end

      it 'uses class wide max for count' do
        expect(subject[:count][:max]).to eq(described_class::MAX_COUNT)
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
