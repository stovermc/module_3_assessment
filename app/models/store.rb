class Store
  attr_reader :long_name,
              :city,
              :distance,
              :phone,
              :store_type

  def initialize(attrs = {})
    @long_name  = attrs[:longName]
    @city       = attrs[:city]
    @distance   = attrs[:distance]
    @phone      = attrs[:phone]
    @store_type = attrs[:storeType]
  end

  def self.find_by_zip(zip)
    response = Faraday.get "https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeId,longName,city,distance,phone,storeType&pageSize=16&apiKey=#{ENV['API_KEY']}"
    stores = JSON.parse(response.body, symbolize_names: true)[:stores]
    stores.each do |raw_store|
      Store.new(raw_store)
    end
  end
end
