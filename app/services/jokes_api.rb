class JokesApi
  include HTTParty
  base_uri "https://geek-jokes.sameerkumar.website/api?format=json"

  def self.get_random_fact
    response = get("")
  end
end