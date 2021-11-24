class PagesController < ApplicationController
  def main
    client = GithubApi::V3::Client.new
    @repositories = client.user_repos("magundacan")
    @profile = client.my_profile
  end
end
