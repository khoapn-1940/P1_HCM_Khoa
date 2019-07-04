class AvatarUploader < CarrierWave::Uploader::Base
  storage :file
  def store_dir
    "app/assets/avatar"
  end
end
