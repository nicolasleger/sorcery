require 'sorcery'
require 'rails'

module Sorcery
  # The Sorcery engine takes care of extending ActiveRecord (if used) and ActionController,
  # With the plugin logic.
  class Engine < Rails::Engine
    config.sorcery = ::Sorcery::Controller::Config

    initializer 'extend Controller with sorcery' do
      ActionController::Base.send(:include, Sorcery::Controller)
      ActionController::Base.helper_method :current_user
      ActionController::Base.helper_method :logged_in?
    end
  end
end
