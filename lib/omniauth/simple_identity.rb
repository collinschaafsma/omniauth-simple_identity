require 'omniauth'

module OmniAuth
  module Strategies
    autoload :SimpleIdentity, 'omniauth/strategies/simple_identity'
  end

  module SimpleIdentity
    autoload :Model,            'omniauth/simple_identity/model'
    autoload :SecurePassword,   'omniauth/simple_identity/secure_password'
    module Models
      autoload :ActiveRecord,   'omniauth/simple_identity/models/active_record'
      autoload :MongoMapper,    'omniauth/simple_identity/models/mongo_mapper'
      autoload :Mongoid,        'omniauth/simple_identity/models/mongoid'
    end
  end
end
