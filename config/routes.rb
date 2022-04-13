Rails.application.routes.draw do
  resources :priority_lists
  resources :research_papers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "research_papers#index"

  match 'research_papers_update_priority', :to => 'research_papers#update_priority', :via => [:get, :post, :put]
end
