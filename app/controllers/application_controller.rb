class ApplicationController < ActionController::Base

  def gback

    render ({:template => "homey.html.erb"})

  end 
end
