require 'mongoid'

module OmniAuth
  module SimpleIdentity
    module Models
      module Mongoid

        def self.included(base)

          base.class_eval do

            include ::OmniAuth::SimpleIdentity::Model
            include ::OmniAuth::SimpleIdentity::SecurePassword

            has_secure_password

            def self.auth_key=(key)
              super
              validates_uniqueness_of key, :case_sensitive => false
            end

            def self.locate(key)
              where(auth_key => key).first
            end

          end

        end

      end
    end
  end
end
