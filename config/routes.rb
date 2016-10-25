Rails.application.routes.draw do
	root 'landing#index'

  devise_for :users
	
	resources :movies, only: [:index, :show, :create, :destroy] do
		resources :reviews, except: [:index, :new, :show], shallow: true
	end

	# search movies route
  get 'search' => 'movies#search' # search_path => /search
  # movie details route
  get 'details/:imdb_id' => 'movies#details', as: 'details' # details_path(:id) => /details/:id
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
