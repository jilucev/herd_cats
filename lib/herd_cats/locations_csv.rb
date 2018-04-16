require 'csv'
require 'exifr/jpeg'
require_relative 'image_data'

# Used to Set CSV column titles
# @return [Array<String>] array of csv column titles
CSV_COLUMN_TITLES = [
  'File Name',
  'Latitude',
  'Longitude'
]

class LocationsCSV
  # includes the ImageData module,
  # which provides methods for getting gps information for a file
  include ImageData
  attr_accessor :image_paths, :image_path

  # Initializes LocationsCSV with image_paths
  #
  # @param [Array<String>] an array of image file paths
  def initialize(image_paths)
    @image_paths = image_paths
  end

  # Generates a csv with ImageData information for image_paths
  #
  # @return [CSV] returns a csv file
  def generate_csv_for_images
    CSV.open(csv_filename, 'wb' ) do |csv|
      csv << CSV_COLUMN_TITLES

      image_paths.each do |image_path|

        @image_path = image_path

        raise ArgumentError.new(invalid_file_message) unless file_exists?

        csv << csv_row_for_file
      end
    end
  end

  private

  # Sets a unique filename for a csv using current timestamp
  #
  # @private
  # @return [String] unique csv filename
  def csv_filename
    timestamp = Time.now.strftime('%Y%j%d-%H:%M')
    "cat_coordinates_csv_#{timestamp}.csv"
  end

  # Sets a unique filename for a csv using current timestamp
  #
  # @private
  # @param [String] path to an image file
  # @return [Boolean] whether or not there is a file matching the given filepath
  def file_exists?
    File.exist?(image_path)
  end

  # Raises an error for invalid file
  #
  # @param [String] path to an image file
  # @return [GLI::CustomExit] error with message
  def invalid_file_message
    "#{image_path} is not a valid file"
  end

  # For a given image,
  # Builds an array that will be assigned to a line of the csv
  #
  # @param [String] path to a jpg
  # @return [Array<String,Float>] Array of image filename, lat, and long
  def csv_row_for_file
    image_meta = image_to_exif(image_path)
    [filename_for(image_path), latitude_for(image_meta), longitude_for(image_meta)]
  end
end
