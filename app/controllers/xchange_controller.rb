class XchangeController < ApplicationController

#    <%@array_of_symbols.each do |a_symbol|%>
#    <% end %>

  def show_coins
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symhash = @parsed_data.fetch("symbols")
    @symkeys = @symhash.keys
    render ({:template => "forex_templates/choose_source.html.erb"})
  end 
  
#  Parameters: {"convert_from"=>"USD", "convert_to"=>"USD"}
  def select_coin
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symhash = @parsed_data.fetch("symbols")
    @symkeys = @symhash.keys
    @src = params.fetch("convert_from").upcase
    render ({:template => "forex_templates/choose_target.html.erb"})
  end 
  

  def convert_coin
    @src = params.fetch("convert_from").upcase
    @src2 = params.fetch("convert_to").upcase
    @raw_data = open("https://api.exchangerate.host/convert?" + "from=" + @src + "&to=" + @src2).read
    @parsed_data = JSON.parse(@raw_data)
    p @inf = @parsed_data.fetch("info")
    p @rat = @inf.fetch("rate")
    render ({:template => "forex_templates/convert_coin.html.erb"})

  end 


end
