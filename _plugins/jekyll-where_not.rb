module Jekyll
  module WhereNotFilter
    def wherenot(input, property, value)
      return input unless input.is_a?(Enumerable)
      input = input.values if input.is_a?(Hash)
      input.select { |object| Array(item_property(object, property)).map(&:to_s).include?(value.to_s) == false}
    end
  end
end

Liquid::Template.register_filter(Jekyll::WhereNotFilter)
