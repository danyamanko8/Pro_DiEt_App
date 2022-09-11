module MealPropertiesParser
  def fetch_meal_properties(title)
    response = HTTParty.get("https://api.calorieninjas.com/v1/nutrition",
                            headers: headers, query: { 'query' => title })
    return 'Wrong' unless response.code == 200
    meal_hash = JSON.parse(response.body).fetch('items')
    calories = meal_hash.reduce(0) { |acc, el| acc + el.fetch('calories') }
    grams = meal_hash.reduce(0) { |acc, el| acc + el.fetch('serving_size_g') }
    nutrients = {}
    meal_hash.each do |hash|
       hash.each do |key, value|
          nutrients[key].nil? ? nutrients[key] = value : nutrients[key] += value
       end
    end
    { calories: calories, grams: grams, nutrients: nutrients }
  end
  private
  def headers
   {'X-Api-Key' => 'ySjIC+/CvEUrdcNseOvvdA==X1qeAamAuX6Ncxyl'}
  end
end
