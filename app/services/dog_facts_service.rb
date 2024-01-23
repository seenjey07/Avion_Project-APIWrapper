class DogFactsService
  include HTTParty
  base_uri "https://dogapi.dog/api/v2"

  def self.get_random_fact
    response = get("/facts.json")
    fact = response.parsed_response["data"].first["attributes"]["body"]

    fact
  end
end