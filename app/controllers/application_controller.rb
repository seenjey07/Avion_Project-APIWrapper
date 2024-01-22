class ApplicationController < ActionController::Base
  def index
    @dog_facts = DogFactsService.get_random_fact
  end
end
