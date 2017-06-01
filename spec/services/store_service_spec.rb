require 'rails_helper'

describe StoreService do
  context '.find_by_zip' do
    it "returns stores by zip" do
      raw_stores = StoreService.find_by_zip('80202')
      store = raw_stores.first

      expect(raw_stores).to be_an(Array)
      expect(raw_stores.count).to eq (16)
      expect(store).to be_an(Hash)
      expect(store['longName']).to eq("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
      expect(store['city']).to eq("DENVER")
    end
  end
end
