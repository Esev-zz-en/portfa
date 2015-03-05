Rails.application.routes.draw do
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' }
  root to: 'home#index'
  namespace :dashboard do
    root to: 'projects#index'
    resource :site, only: [:edit, :update]
    resources :projects, :pages, :site_assets
  end

  scope constraints: { username: /[a-z0-9]+/ } do
    get '/:username', to: 'site/pages#show', defaults: { page_slug: 'home' }, as: :site
    get '/:username/projects/:project_slug', to: 'site/pages#show', defaults: { page_slug: 'project' }, as: :site_project
    get '/:username/:page_slug', to: 'site/pages#show', as: :site_page
    get '/:username/assets/:file_name', to: 'site/site_assets#show', as: :site_asset, constraints: { file_name: /[a-z_]+\.(js|css)/ }
  end
end
