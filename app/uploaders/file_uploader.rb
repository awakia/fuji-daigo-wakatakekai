class FileUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  if ENV['AWS_S3_BUCKET'].present?
    storage :fog
  else
    storage :file
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "#{model.class.to_s.underscore.pluralize}/#{mounted_as}/#{model.id}"
  end

  process resize_to_limit: [800, 800], if: :image?

  version :thumb, if: :image? do
    process resize_to_limit: [200, 200]
  end

  protected
    def image?(file)
      file.content_type.start_with? 'image'
    end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
