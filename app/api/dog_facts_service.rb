class DogFactsService
  include HTTParty
  base_uri "https://dogapi.dog/api/v2"

  def self.get_random_fact
    response = get("/facts.json")
    fact = response.parsed_response["data"].first["attributes"]["body"]

    Rails.logger.info("API Response: #{response.inspect}")
    Rails.logger.info("Random Dog Fact: #{fact}")
    fact

  end
end