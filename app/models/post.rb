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

  def draft?
    draft
  end

  def parsed_content
    unless @parsed_content
      @parsed_content = ""
      segments = content.split /(\[\[.*?\]\])/
      segments.each do |seg|
        matched = seg.match /\[\[(.*?)(?:\((\d+),(\d+)\))?(:nolink|:link|:square)?(:thumb)?\]\]/i
        if matched && matched[1] == '[gallery]'
          Upload.where(category: "#{path}##{hash_name}").order(:created_at).each do |upload|
            image = "<a href='#{upload.url}'><img class='content-image' src='#{upload.thumb_url}'></a>"
            @parsed_content += image
          end
        elsif matched && (upload = Upload.get(matched[1]))
          size_condition = matched[2] && matched[3] ? " width='#{matched[2]}px' height='#{matched[3]}px'" : ""
          image = ''
          if matched[4] == ':square'
            image = "<a href='#{upload.url}'>■</a>"
          elsif matched[4] == ':link'
            image = "<a href='#{upload.url}'>#{upload.filename}</a>"
          else
            image_url = matched[5] == ':thumb' ? upload.thumb_url : upload.url
            image = "<img class='content-image' src='#{image_url}'#{size_condition}>"
            image = "<a href='#{upload.url}'>#{image}</a>" if matched[4] != ':nolink'
          end
          @parsed_content += image
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
