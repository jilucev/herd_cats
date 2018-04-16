require 'rspec'
require_relative '../locations_csv'
require 'pry'

RSpec.describe LocationsCSV do

  describe '#get_coordinates' do
    it 'Returns an array of file paths' do
      image_dir = Dir.glob("./gps_images/**/*.jpg")
      locations_csv = LocationsCSV.new(image_dir).generate_csv_for_images
      expect(locations_csv).to be_kind_of Array
      expect(locations_csv).to match_array image_dir
    end
  end
end
