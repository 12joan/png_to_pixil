require "ostruct"

class OpenStruct
  def deep_to_h
    process = ->(x) {
      case x
      when OpenStruct
        process[x.to_h]
      when Array
        x.map(&process)
      when Hash
        x.transform_values(&process)
      else
        x
      end
    }

    process[self]
  end
end
