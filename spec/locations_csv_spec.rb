require 'rspec'
require_relative '../locations_csv'
require 'pry'

RSpec.describe LocationsCSV do

  describe '#generate_csv_for_images' do
    it 'Returns an array of file paths' do
      image_dir = Dir.glob("./gps_images/**/*.jpg")
      locations_csv = LocationsCSV.new(image_dir).generate_csv_for_images
      expect(locations_csv).to be_kind_of Array
      expect(locations_csv).to match_array image_dir
    end

    it 'Returns an empty array if an image does not exist' do
      non_existant_image = ["./gps_images/non_existant_image.jpg"]

      expect { LocationsCSV.new(non_existant_image).generate_csv_for_images }
        .to raise_error("#{non_existant_image.first} is not a valid file")
    end
  end
end
