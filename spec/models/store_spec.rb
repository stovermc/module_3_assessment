require 'rails_helper'

describe Store do
  context '.find_by_zip' do
    it 'is a legit store' do
      raw_store = {
        longName: "BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER",
        city:      "DENVER",
        distance:  3.45,
        phone:     "303-270-9189",
        storeType: "Mobile SAS" }

      store = Store.new(raw_store)

      expect(store.long_name).to eq("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
      expect(store.city).to eq("DENVER")
      expect(store.distance).to eq(3.45)
      expect(store.phone).to eq("303-270-9189")
      expect(store.store_type).to eq("Mobile SAS")
    end
  end
end
