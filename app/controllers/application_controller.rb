class ApplicationController < ActionController::API
    before_action :authorized
    
    def encode_token(payload)
        JWT.encode(payload, 'T**Q2b2cLwMCLA&m')
    end

    def auth_header
        request.header['Authorization']
    end

    def decoded_token(token)
        if auth_header
            @token = auth_header.split(' ')[1]
            begin
                JWT.decode(@token, 'T**Q2b2cLwMCLA&m')
            rescue JWT::DecodeError
                nil
            end
        else
            nil
        end
    end

    def current_user
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def logged_in?
        !!current_user
    end

    def authorized
        render json: {message: 'Please Log In'}, status: unauthorized unless logged_in?
    end
end
