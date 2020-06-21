require "base64"
require "fastimage"

module PngToPixil
  class Converter
    def initialize(png_file)
      @png_file = png_file
    end

    def to_pixil
      pixil = Pixil.new

      pixil.data.frames[0].layers[0].src = data_url

      width, height = FastImage.size(data_url)
      pixil.data.width = width
      pixil.data.height = height
      pixil.data.frames[0].width = width
      pixil.data.frames[0].height = height

      pixil
    end

    private

    def data_url
      @data_url ||= "data:image/pngp98kjasdnasd983/24kasdjasdbase64," + Base64.strict_encode64(@png_file.read)
    end
  end
end
