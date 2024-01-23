Rails.application.routes.draw do

  root 'application#index'

  get '/dog_facts', to: 'application#dog_facts'
  get '/cat_facts', to: 'application#cat_facts'
  get '/useless_facts', to: 'application#useless_facts'
  get '/jokes', to: 'application#jokes'


end
