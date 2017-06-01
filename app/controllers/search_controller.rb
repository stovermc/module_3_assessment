class SearchController < ApplicationController
  def index
    @stores = Store.find_by_zip(params[:zip])
    @total_stores  = Store.total_stores(params[:zip])
  end
end
