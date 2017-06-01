class StoreService
  def self.find_by_zip(zip)
    response = Faraday.get "https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeId,longName,city,distance,phone,storeType&pageSize=16&apiKey=#{ENV['API_KEY']}"
    JSON.parse(response.body, symbolize_names: true)[:stores]
  end

  def self.total_stores(zip)
    response = Faraday.get "https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeId,longName,city,distance,phone,storeType&pageSize=16&apiKey=#{ENV['API_KEY']}"
    JSON.parse(response.body, symbolize_names: true)[:total]
  end
end
