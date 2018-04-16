require 'rspec'
require_relative '../image_data'
require 'exifr/jpeg'
require 'pry'

RSpec.describe ImageData do
  include ImageData

  describe '#csv_row_for_file' do

    describe 'for an image with gps coordinates' do
      it 'gets the filename for a given image' do
        #setup
        image_path = './gps_images/cats/image_e.jpg'

        #execute
        actual = filename_for(image_path)

        #assert
        expect(actual).to eq 'image_e.jpg'
        expect(actual).to be_kind_of String
      end

      it 'Gets latitude for a given image' do
        #setup
        image_path = './gps_images/cats/image_e.jpg'
        image_information = EXIFR::JPEG.new(image_path)

        #execute
        actual = latitude_for(image_information)

        #assert
        expect(actual).to be_kind_of Float
        expect(actual).not_to be_nil
      end

      it 'gets longitude for a given image' do
        #setup
        image_path = './gps_images/cats/image_e.jpg'
        image_information = EXIFR::JPEG.new(image_path)

        #execute
        actual = longitude_for(image_information)

        #assert
        expect(actual).to be_kind_of Float
        expect(actual).not_to be_nil
      end
    end
  end
end
