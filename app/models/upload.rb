class Upload < ActiveRecord::Base
  belongs_to :post
  mount_uploader :file, FileUploader
  before_save :set_info

  validates_presence_of :file

  def image_type?
    file && file.content_type.start_with?('image')
  end

  def filename
    file ? file.file.filename : nil
  end

  def url
    file ? file.url : nil
  end

  def thumb_url
    file ? (file.thumb.present? ? file.thumb.url : file.url) : nil
  end

  def self.get(name, category: nil)
    scope = Upload.order(:id)
    res = nil
    res = scope.where(category: category, name: name).last if category.present?
    res ||= scope.where(name: name).last
  end

  def self.get_url(name, category: nil)
    get(name, category: category).try(:url)
  end

  def set_info
    self.name = filename if name.blank?
    self.category = post.path if category.blank? && post.present?
  end
end
