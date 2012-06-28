require 'httparty'

class GovRepos
  def get_repos
    
    gov_accounts = HTTParty.get "http://registry.usa.gov/accounts.json?service_id=github&agency_id=&tag="

    result = gov_accounts["accounts"].map do |account|
      username = account["service_url"].split("http://github.com/")[1]
      account_repositories = HTTParty.get "https://api.github.com/users/#{username}/repos"
      
      account_repositories.map do |repository|
        repository
      end

    end
  end
end
