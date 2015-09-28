class Post < ActiveRecord::Base
  DEFAULT_COUNT = 25
  MAX_COUNT = 50

  include AASM

  aasm column: :state do
    state :concept, initial: true
    state :published

    event :publish do
      transitions from: :concept, to: :published
    end

    event :unpublish do
      transitions from: :published, to: :concept
    end
  end

  paginates_per DEFAULT_COUNT
  max_paginates_per MAX_COUNT
end
