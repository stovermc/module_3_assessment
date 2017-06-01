class SearchController < ApplicationController
  def index
    response = Faraday.get "https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=storeId,longName,city,distance,phone,storeType&pageSize=16&apiKey=ru99w3xp6qu5848qvbgrznxq"
    @stores = JSON.parse(response.body, symbolize_names: true)[:stores]
  end
end