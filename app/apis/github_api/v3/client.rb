# error handling will be added tomorrow

module GithubApi
  module V3
    class Client
      def user_repos(username)
        request(
          http_method: :get,
          endpoint: "/users/#{username}/repos",
          # params (if endpoint needs it)
          # not 100% sure if this is how it's done; please try in the console first
          params: {
            random_param: 123
          }
        )
      end

      def my_profile
        request(
          http_method: :get,
          endpoint: "/user"
        )
      end

      def new_endpoint
        request(
          http_method: :post, 
          endpoint: "/endpoint"
        )
      end

      private

      def request(http_method:, endpoint:, params: {})
        response = connection.public_send(http_method, endpoint, params)
        JSON.parse(response.body)
      end

      def connection
        @connection ||= Faraday.new(
          url: "https://api.github.com",
          headers: {
            # you may not need Authorization header depending on your chosen API
            "Authorization" => "Bearer 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"
          },
          # params
          # not 100% sure; please try it in the console first
          params: {api_key: '123abc'}
        )
      end
    end
  end
end
