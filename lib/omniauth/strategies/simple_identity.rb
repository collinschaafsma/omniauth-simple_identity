module OmniAuth
  module Strategies
    # The identity strategy allows you to provide simple internal 
    # user authentication using the same process flow that you
    # use for external OmniAuth providers.
    class SimpleIdentity
      include OmniAuth::Strategy

      option :fields, [:name, :email]
      option :on_failed_registration, nil

      def request_phase
        [ 404, {'Content-Type' => 'text/plain'}, 'file not found' ]
      end

      def callback_phase
        return fail!(:invalid_credentials) unless identity
        super
      end

      def other_phase
        if on_registration_path?
          if request.get?
            registration_form
          elsif request.post?
            registration_phase
          end
        else
          call_app!
        end
      end

      def registration_form
        [ 404, {'Content-Type' => 'text/plain'}, 'file not found' ]
      end

      def registration_phase
        attributes = (options[:fields] + [:password, :password_confirmation]).inject({}){|h,k| h[k] = request[k.to_s]; h}
        @identity = model.create(attributes)
        if @identity.persisted?
          env['PATH_INFO'] = callback_path
          callback_phase
        else
          if options[:on_failed_registration]
            self.env['omniauth.identity'] = @identity
            options[:on_failed_registration].call(self.env)
          else
            registration_form
          end
        end
      end

      uid{ identity.uid }
      info{ identity.info }

      def registration_path
        options[:registration_path] || "#{path_prefix}/#{name}/register"
      end

      def on_registration_path?
        on_path?(registration_path)
      end

      def identity
        @identity ||= model.authenticate(request['auth_key'], request['password'])
      end

      def model
        options[:model] || ::Identity
      end
    end
  end
end
