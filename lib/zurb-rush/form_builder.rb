module ZurbRush
  class FormBuilder < ActionView::Helpers::FormBuilder
    def input(field, options = {})
      field_map = {
        /password/ => "password_field",
        /email/ => "email_field",
        /url/ => "url_field",
        /phone/ => "phone_field",
        /fax/ => "phone_field",
        /./ => "text_field"
      }

      matcher = options.delete(:as) || field
      field_type = field_map.to_a.select { |k, v| k === matcher }.first[1]

      label_text = options.delete(:label)

      #field_opts = {}

      label(field, label_text) + self.send(field_type, field)
    end
  end
end
