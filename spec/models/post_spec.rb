require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'scopes' do
    let(:concept_post) { create(:post, :concept) }
    let(:published_post) { create(:post, :published) }

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
end
