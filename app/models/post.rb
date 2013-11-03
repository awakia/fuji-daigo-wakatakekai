class Post < ActiveRecord::Base
  before_save :set_draft
  before_create :set_published_at

  scope :published, -> {
    where(Post.arel_table[:published_at].not_eq(nil))
  }

  def draft=(val)
    if val.to_i != 0
      @set_draft = true
    end
  end

  def draft
    published_at == nil
  end

  private
    def set_draft
      if @set_draft
        self.published_at = nil
        @set_draft = nil
      end
    end

    def set_published_at
      self.published_at = Time.now unless @set_draft
    end
end
