class ApplicationController < ActionController::Base
  def index
  end

  def dog_facts
    @dog_fact = DogFactsService.get_random_fact
  end

  def cat_facts
    @cat_fact = CatFactsApi.get_random_fact
  end

  def useless_facts
    @useless_fact = UselessFactsApi.get_random_fact
  end

  def jokes
    @joke = JokesApi.get_random_fact
  end

end

