class Post < ActiveRecord::Base
  before_create :set_published_at

  scope :published, -> {
    where(Post.arel_table[:published_at].not_eq(nil))
  }

  private
    def set_published_at
      self.published_at = Time.now
    end
end
