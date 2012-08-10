class DemoController < ApplicationController
  def set_flash
    redirect_to root_url, :notice => "This is a Rails notice.", :alert => "This is a Rails alert."
  end
end
