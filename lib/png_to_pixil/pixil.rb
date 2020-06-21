require "json"
require "ostruct"
require "png_to_pixil/open_struct"

module PngToPixil
  class Pixil
    attr_reader :data

    def initialize
      @data = JSON.parse(template_json, object_class: OpenStruct)
    end

    def to_json
      data.deep_to_h.to_json
    end

    private

    def template_json
      File.read(
        File.expand_path("template.json", File.dirname(__FILE__))
      )
    end
  end
end
