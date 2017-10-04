require 'director/handlers/base'
require 'director/handlers/passthrough'
require 'director/handlers/proxy'
require 'director/handlers/redirect'
require 'director/model_extensions'

module Director
  class Engine < Rails::Engine
    initializer 'director.load_model_extensions' do |app|
      ActiveSupport.on_load(:active_record) do
        ActiveRecord::Base.extend Director::ModelExtensions::ActMethod
      end
    end
  end
end
