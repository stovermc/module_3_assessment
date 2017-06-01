require 'rails_helper'

describe "items API" do
  it "returns all items" do
    items = create_list(:item, 3)

    get '/api/v1/items'

    items = JSON.parse(response.body)

    expect(response).to be_success
    expect(items.count).to eq 3
  end

end
