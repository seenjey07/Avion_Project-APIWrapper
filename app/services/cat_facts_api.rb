class CatFactsApi
  include HTTParty
  base_uri "https://cat-fact.herokuapp.com"

  def self.get_random_fact
    response = get("/facts")
    random_index = rand(response.parsed_response.length)
    cat_fact = response.parsed_response[random_index]['text']
    return cat_fact
  end
end