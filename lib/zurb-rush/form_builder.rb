module ZurbRush
  class FormBuilder < ActionView::Helpers::FormBuilder
    FIELD_MATCHERS = {
      /password/ => :password,
      /email/ => :email,
      /phone/ => :phone,
      /fax/ => :phone
      /url/ => :url,
      String => :text
    }

    def input(field_name, options = {})
      label_text = options.delete(:label)
      label(field_name, label_text) + field(field_name, options)
    end

    def field(field_name, options = {})
      field_name = field_name.to_s

      field_type = options.delete(:as)
      field_type ||= FIELD_MATCHERS.to_a.select { |matcher, type| matcher === field_name }.map { |_, type| type }.first

      send("#{field_type}_field", field_name, options)
    end
  end
end