class Upload < ActiveRecord::Base
  belongs_to :post

  def image_type?
    name =~ /\.(jpe?g|png|gif|tiff?|bmp)$/i
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
