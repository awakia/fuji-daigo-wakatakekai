class Post < ActiveRecord::Base
  before_save :set_draft
  before_create :set_published_at

  validates_uniqueness_of :hash_name, scope: :path, allow_nil: true, allow_blank: true

  has_many :uploads

  FORMATS = [:text, :html]
  as_enum :format, FORMATS, prefix: true

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

  def parsed_content
    unless @parsed_content
      @parsed_content = ""
      segments = content.split /(\[\[.*?\]\])/
      segments.each do |seg|
        matched = seg.match /\[\[(.*?)(?:\((\d+),(\d+)\))?\]\]/
        if matched && (upload = Upload.get(matched[1]))
          size_condition = matched[2] && matched[3] ? " width='#{matched[2]}px' height='#{matched[3]}px'" : ""
          @parsed_content += "<img class='content-image' src='#{upload.url}'#{size_condition}>"
        else
          @parsed_content += seg
        end
      end
    end
    @parsed_content
  end

  def processed_content
    if format_text?
      nl2br parsed_content
    else
      parsed_content.to_s.html_safe
    end
  end

  private
    def set_draft
      if @set_draft
        self.published_at = nil
        @set_draft = nil
      end
    end

    def set_published_at
      self.published_at ||= Time.now unless @set_draft
    end

    def nl2br(str)
      return ''.html_safe if str.blank?
      str = str.split(/\r\n|\n\r|\r|\n/o).map {|line| line }.join('<br>')
      str.html_safe
    end
end
