class UselessFactsApi
  include HTTParty
  base_uri "https://uselessfacts.jsph.pl/api/v2"

  def self.get_random_fact
    response = get("/facts/random.json")
    response.parsed_response["text"]
    # uselessfact = response.parsed_response["data"].first["attributes"]["body"]

  end
end