module ZurbRush
  class Railtie < Rails::Railtie
    ActiveSupport.on_load(:action_view) do
      include ZurbRush::ViewHelpers
    end
  end
end
