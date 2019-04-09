module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private

    def find_verified_user
      begin
        token = cookies[:token]
        # Rails.application.secrets.secret_key_base
        decoded_token = JWT.decode token.strip, 'h3llo', true, { :algorithm => 'HS256' }
        if (current_user = User.find((decoded_token[0])['user_id']))
          current_user
        else
          reject_unauthorized_connection
        end
      rescue
        reject_unauthorized_connection
      end
    end
  end
end
