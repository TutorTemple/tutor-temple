class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include Cloudinary::CarrierWave

  def default_public_id
    'local_files/default_avatar'
  end

  version :small do
    resize_to_fit(30, 30)
  end

  version :medium do
    resize_to_fit(120, 120)
  end

  def extension_white_list
    %w[jpg jpeg png]
  end
end
