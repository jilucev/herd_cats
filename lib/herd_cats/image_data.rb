require 'exifr/jpeg'

module ImageData

  # Returns the filename for an image path
  #
  # @param [String] path to a jpg
  # @return [String] Filename for there image path
  def filename_for(image_path)
    File.basename(image_path)
  end

  # Returns the latitude from the image meta
  # returns nil if latitude is not represent
  # assumes that the csv values should be blank in that case
  #
  # @param [EXIFR::JPEG] meta for an image
  # @return [Float] Latitude from the image meta
  def latitude_for(image_meta)
    image_meta&.gps&.latitude
  end

  # Returns the longitude from the image meta
  # returns nil if latitude is not represent
  # assumes that the csv values should be blank in that case
  #
  # @param [EXIFR::JPEG] meta for an image
  # @return [Float] Longitude from the image meta
  def longitude_for(image_meta)
    image_meta&.gps&.longitude
  end

  # Initializes a module to read metadata from images
  #
  # @param [EXIFR::JPEG] module that reads metadata for an image
  # @return [Float] Latitude from the image meta
  def image_to_exif(image_path)
    if image_path.match(/\.jp(e)?g/)
      return EXIFR::JPEG.new(image_path)
    else
      return EXIFR::TIFF.new(image_path)
    end
  end
end
