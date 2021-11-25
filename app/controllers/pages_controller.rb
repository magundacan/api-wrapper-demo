class PagesController < ApplicationController
  def main
    client = GithubApi::V3::Client.new
    begin
      # @repositories = client.user_repos("magundacannnn")
      @profile = client.my_profile
    rescue ApiExceptions::UnauthorizedError
      @error = true
    end
  end
end
