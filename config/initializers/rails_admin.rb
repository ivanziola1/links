RailsAdmin.config do |config|
  config.current_user_method(&:current_user)
  config.parent_controller = 'ApplicationController'
  config.authorize_with :cancan
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
