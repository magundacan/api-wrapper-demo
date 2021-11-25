module GithubApi
  module V3
    class Client
      include HttpStatusCodes
      include ApiExceptions

      BASE_URL = "https://api.github.com"
      ACCESS_TOKEN = ""

      def user_repos(username)
        request(
          http_method: :get,
          endpoint: "/users/#{username}/repos"
        )
      end

      def my_profile
        request(
          http_method: :get,
          endpoint: "/user"
        )
      end

      private

      def request(http_method:, endpoint:, params: nil, headers: nil)
        @response = connection.public_send(http_method, endpoint, params, headers)        
        parsed_response = JSON.parse(@response.body)
        return parsed_response if @response.status == HTTP_OK_CODE
        raise error_class
      end

      def connection
        @connection ||= Faraday.new(
          url: BASE_URL,
          headers: {
            "Authorization" => "Bearer #{ACCESS_TOKEN}"
          },
        )
      end

      def error_class
        case @response.status
        when HTTP_NOT_FOUND_CODE
          NotFoundError
        when HTTP_UNAUTHORIZED_CODE
          UnauthorizedError
        else
          ApiError
        end
      end
    end
  end
end
