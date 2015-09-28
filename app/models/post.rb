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

  def self.index_meta
    {
      filters: filters,
      page: all.current_page,
      count: all.limit_value,
      total_count: all.total_count
    }
  end

  def self.filters
    {
      page: { type: :integer, default: 1, min: 1 },
      count: { type: :integer, default: DEFAULT_COUNT, min: 1, max: MAX_COUNT }
    }
  end
end
