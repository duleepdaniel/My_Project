Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "github#home"
  get '/projects', to: "github#projects"
  get '/top10', to: "github#top_10"
  get '/top10/ruby', to: "github#ruby_top_10"
end
