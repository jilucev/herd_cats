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

  # Initializes LocationsCSV with image_files
  #
  # @param [Array<String>] an array of image file paths
  def initialize(image_files)
    @image_files = image_files
  end

  # Generates a csv with ImageData information for image_files
  #
  # @return [CSV] returns a csv file
  def generate_csv_for_images
    CSV.open(csv_filename, 'wb' ) do |csv|
      csv << CSV_COLUMN_TITLES

      @image_files.each do |image_file|

        exit_now!("#{image_file} is not a valid file") unless file_is_valid?(image_file)

        csv << extract_file_information(image_file)
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
  def file_is_valid?(image_file)
    File.exist?(image_file)
  end
end
