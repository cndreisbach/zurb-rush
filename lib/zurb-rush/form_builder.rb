module ZurbRush
  class FormBuilder < ActionView::Helpers::FormBuilder
    FIELD_NAME_MATCHERS = {
      /password/ => :password,
      /search/ => :search,
      /email/ => :email,
      /phone/ => :phone,
      /fax/ => :phone,
      /url/ => :url,
      /time_zone/ => :time_zone
    }

    def input(field_name, options = {})
      label_text = options.delete(:label)
      label(field_name, label_text) + field(field_name, options)
    end

    def field(field_name, options = {})
      field_name = field_name.to_s

      field_type = options.delete(:as)
      field_type ||= FIELD_NAME_MATCHERS.to_a.select { |matcher, type| matcher === field_name }.map { |_, type| type }.first
      field_type ||= :text

      send("#{field_type}_field", field_name, options)
    end

    def time_zone_field(field_name, options)
      time_zone_select(field_name, options)
    end
  end
end
