class AttachmentUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include Cloudinary::CarrierWave

  storage :file

  def extension_white_list
    %w[jpg jpeg png pdf doc htm html docx]
  end
end
