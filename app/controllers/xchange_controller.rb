class XchangeController < ApplicationController

  def show_coins
    #@array_of_symbols = 
    render ({:template => "forex_templates/choose_source.html.erb"})
  end 
  
#  Parameters: {"convert_from"=>"USD", "convert_to"=>"USD"}
  def select_coin
    #@array_of_symbols = 
    @src = params.fetch("convert_from").capitalize
    render ({:template => "forex_templates/choose_target.html.erb"})
  end 
  

  def convert_coin
    @fsrc = params.fetch("convert_from").capitalize
    @src2 = params.fetch("convert_to").capitalize
    render ({:template => "forex_templates/convert_coin.html.erb"})

  end 


end
