require 'rails_helper'

describe "items API" do
  it "returns all items" do
    items = create_list(:item, 3)

    get '/api/v1/items'

    items = JSON.parse(response.body)
    item = items.first

    expect(response).to be_success
    expect(items.count).to eq 3
  end

  it "returns a single item" do
    id = create(:item).id

    get "/api/v1/items/#{id}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item['id']).to eq id
  end

  it "can create an item" do
    item_params = { name: "shovel",
                    description: "very robust",
                    image_url: Faker::Placeholdit.image }

    post "/api/v1/items", params: item_params

    item = Item.last
    assert_response :success
    expect(response).to be_success

    expect(item.name).to eq "shovel"
    expect(item.description).to eq "very robust"
  end

  it "can update an existing item" do
    item = create(:item)
    previous_name = item.name
    item_params = { name: "spade" }

    put "/api/v1/items/#{item.id}", params: item_params

    item = Item.find_by(id: item.id)

    expect(response).to be_success
    expect(item.name).to_not eq previous_name
    expect(item.name).to eq "spade"
  end

  it "can delete an existing item" do
    id = create(:item).id

    expect(Item.count).to eq 1

    delete "/api/v1/items/#{id}"

    expect(Item.count).to eq 0
    expect{Item.find(id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
