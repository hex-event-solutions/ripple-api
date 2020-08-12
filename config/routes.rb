# frozen_string_literal: true

Rails.application.routes.draw do
  post '/graphql', to: 'graphql#execute'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/website/template', to: 'website#template'
  get '/website/component/:name', to: 'website#component'
  get '/website/styles', to: 'website#styles'

  get '/probe', to: 'probe#probe'

  # get 'test', to: 'mustache#test'
end
