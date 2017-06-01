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
    StoreService.find_by_zip(zip).map do |raw_store|
      Store.new(raw_store)
    end
  end

  def self.total_stores(zip)
    StoreService.total_stores(zip)
  end
end
