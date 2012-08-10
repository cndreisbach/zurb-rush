require 'action_view/helpers'
require 'humanize'

module ZurbRush
  module ViewHelpers
    include ActionView::Helpers::TagHelper

    ## The Grid

    def row(options = {})
      options[:class] = add_to_class(options[:class], 'row')

      content_tag :div, options do
        yield
      end
    end

    def columns(columns, options = {})
      classes = ['columns']
      columns = columns.humanize if columns.respond_to?(:humanize)
      classes << columns

      if options[:mobile]
        mobile_cols = options[:mobile]
        mobile_cols = mobile_cols.humanize if mobile_cols.respond_to?(:humanize)
        classes << "mobile-#{mobile_cols}"
      end

      options[:class] = add_to_class(options[:class], *classes)

      content_tag :div, options do
        yield
      end
    end

    ## Alert Boxes

    def alert_box(content, *classes)
      content_tag :div, :class => add_to_class("alert-box", *classes) do
        raw(content + content_tag(:a, '&times;', {:href => '#', :class => 'close'}, false))
      end
    end

    private

    def add_to_class(current_class, *classes_to_add)
      existing_classes = current_class.to_s.split(/s+/)
      classes = existing_classes + classes_to_add
      classes.map(&:to_s).join(" ")
    end
  end
end
