class UselessFactsApi
  include HTTParty
  base_uri "https://uselessfacts.jsph.pl/api/v2"

  def self.get_random_fact
    response = get("/facts/random")
    useless_fact = response.parsed_response["text"]
    return useless_fact
  end
end