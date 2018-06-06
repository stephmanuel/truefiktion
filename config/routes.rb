Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "issues#index"
  # Routes for the Enrollment resource:
  # CREATE
  get "/enrollments/new", :controller => "enrollments", :action => "new"
  post "/create_enrollment", :controller => "enrollments", :action => "create"

  # READ
  get "/enrollments", :controller => "enrollments", :action => "index"
  get "/enrollments/:id", :controller => "enrollments", :action => "show"

  # UPDATE
  get "/enrollments/:id/edit", :controller => "enrollments", :action => "edit"
  post "/update_enrollment/:id", :controller => "enrollments", :action => "update"

  # DELETE
  get "/delete_enrollment/:id", :controller => "enrollments", :action => "destroy"
  #------------------------------

  # Routes for the Medium resource:
  # CREATE
  get "/media/new", :controller => "media", :action => "new"
  post "/create_medium", :controller => "media", :action => "create"

  # READ
  get "/media", :controller => "media", :action => "index"
  get "/media/:id", :controller => "media", :action => "show"

  # UPDATE
  get "/media/:id/edit", :controller => "media", :action => "edit"
  post "/update_medium/:id", :controller => "media", :action => "update"

  # DELETE
  get "/delete_medium/:id", :controller => "media", :action => "destroy"
  #------------------------------

  # Routes for the Week resource:
  # CREATE
  get "/weeks/new", :controller => "weeks", :action => "new"
  post "/create_week", :controller => "weeks", :action => "create"

  # READ
  get "/weeks", :controller => "weeks", :action => "index"
  get "/weeks/:id", :controller => "weeks", :action => "show"

  # UPDATE
  get "/weeks/:id/edit", :controller => "weeks", :action => "edit"
  post "/update_week/:id", :controller => "weeks", :action => "update"

  # DELETE
  get "/delete_week/:id", :controller => "weeks", :action => "destroy"
  #------------------------------

  # Routes for the Stage resource:
  # CREATE
  get "/stages/new", :controller => "stages", :action => "new"
  post "/create_stage", :controller => "stages", :action => "create"

  # READ
  get "/stages", :controller => "stages", :action => "index"
  get "/stages/:id", :controller => "stages", :action => "show"

  # UPDATE
  get "/stages/:id/edit", :controller => "stages", :action => "edit"
  post "/update_stage/:id", :controller => "stages", :action => "update"

  # DELETE
  get "/delete_stage/:id", :controller => "stages", :action => "destroy"
  #------------------------------

  # Routes for the Issue resource:
  # CREATE
  get "/issues/new", :controller => "issues", :action => "new"
  post "/create_issue", :controller => "issues", :action => "create"

  # READ
  get "/issues", :controller => "issues", :action => "index"
  get "/issues/:id", :controller => "issues", :action => "show"

  # UPDATE
  get "/issues/:id/edit", :controller => "issues", :action => "edit"
  post "/update_issue/:id", :controller => "issues", :action => "update"

  # DELETE
  get "/delete_issue/:id", :controller => "issues", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
