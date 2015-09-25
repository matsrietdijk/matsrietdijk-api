class Post < ActiveRecord::Base
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
end
