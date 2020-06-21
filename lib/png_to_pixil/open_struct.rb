require "ostruct"

class OpenStruct
  # Adapted from https://stackoverflow.com/a/33092217
  def deep_to_h
    hash = {}

    self.each_pair do |key, value|
      hash[key] = value.is_a?(OpenStruct) ? value.deep_to_h : value
    end

    hash
  end
end
