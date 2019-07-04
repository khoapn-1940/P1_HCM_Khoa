class TourUploader < CarrierWave::Uploader::Base
  storage :file
  def store_dir
    "app/assets/tour"
  end
end
