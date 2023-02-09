RailsAdmin.config do |config|
  config.asset_source = :webpacker

  config.authenticate_with do
    #sorceryのメソッド
    require_login
    redirect_to root_path, warning: t('defaults.not_authority') unless current_user.admin?
  end
  config.current_user_method(&:current_user)

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == CancanCan ==
  config.authorize_with :cancancan

  config.actions do
    # root actions
    dashboard do
      statistics false
    end
    # collection actions 
    index
    new
    export
    bulk_delete
    # member actions
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
  config.parent_controller = 'ApplicationController'
end
