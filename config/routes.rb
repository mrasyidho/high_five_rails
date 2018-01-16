Rails.application.routes.draw do

  scope module: :v2, constraints: ApiVersion.new('v2') do
    resources :todos, only: :index
  end

  # namespace the controllers without affecting the URI
  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :todos do
      resources :items
    end
  end


  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'

  post 'highfive/transter_highfive', to: 'highfive#transter_highfive'
  get 'highfive/get_current_highfive', to: 'highfive#get_current_highfive'
  get 'highfive/top_highfive_score', to: 'highfive#top_highfive_score'
  get 'highfive/get_highfive_contributor', to: 'highfive#get_highfive_contributor'

end
