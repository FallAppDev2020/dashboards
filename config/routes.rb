Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get("/", { :controller => "application", :action => "gback" })
  get("/forex", { :controller => "xchange", :action => "show_coins" })
  get("/forex/:convert_from", { :controller => "xchange", :action => "select_coin" })
  get("/forex/:convert_from/:convert_to", { :controller => "xchange", :action => "convert_coin" })

end
