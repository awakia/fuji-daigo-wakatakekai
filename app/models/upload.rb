class Upload < ActiveRecord::Base
  belongs_to :post

  def image_type?
    name =~ /\.(jpe?g|png|gif|tiff?|bmp)$/i
  end
end
