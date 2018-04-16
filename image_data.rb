require 'exifr/jpeg'

module ImageData

  # For a given image,
  # Builds an array that will be assigned to a line of the csv
  #
  # @param [String] path to a jpg
  # @return [Array<String,Float>] Array of image filename, lat, and long
  def extract_file_information(image_path)
    image_meta = image_to_exif(image_path)
    [filename_for(image_path), latitude_for(image_meta), longitude_for(image_meta)]
  end

  # Returns the filename for an image path
  #
  # @param [String] path to a jpg
  # @return [String] Filename for there image path
  def filename_for(image_path)
    File.basename(image_path)
  end

  # Returns the latitude from the image meta
  #
  # @param [EXIFR::JPEG] meta for an image
  # @return [Float] Latitude from the image meta
  def latitude_for(image_meta)
    image_meta&.gps&.latitude
  end

  # Returns the longitude from the image meta
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
    EXIFR::JPEG.new(image_path)
  end
end
