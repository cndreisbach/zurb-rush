TestApp::Application.routes.draw do
  root :to => 'demo#index'
  match ":action", :controller => "demo"
end
