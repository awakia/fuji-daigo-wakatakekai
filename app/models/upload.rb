class Upload < ActiveRecord::Base
  belongs_to :post
  mount_uploader :file, FileUploader

  def image_type?
    file && file.content_type.start_with?('image')
  end

  def url
    file ? file.url : nil
  end

  def thumb_url
    file ? file.thumb.url || file.url : nil
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
end
