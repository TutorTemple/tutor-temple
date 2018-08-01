class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include Cloudinary::CarrierWave

  def default_public_id
    'local_files/default_avatar'
  end

  version :medium do
    resize_to_fit(42, 42)
  end

  def extension_white_list
    %w[jpg jpeg png]
  end
end
