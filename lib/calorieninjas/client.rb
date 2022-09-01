require 'httparty'

module Calorieninjas

class Client

  include HTTParty
  base_uri 'api.calorieninjas.com/v1/nutrition'

  def initialize(options = {})
    @options = default_request_options.merge(options)
  end

  def get
    self.class.get(@options)
  end

  def default_request_options
    {
      headers: {'X-Api-Key': ENV['NINJAS_API_KEY']}
    }
  end
end
