require_relative "../lib/scrap_deputies"

describe "the get_deputies function" do

  test = get_deputies #pour ne pas faire plusieurs requetes

  it "should return an array" do
    expect(test.class).to eq(Array)
  end

  it "should return about 500+ deputies_list" do
    expect(test.length > 500).to eq(true)
  end

  it "should return valid emails for Mme Caroline Abadie" do
    expect(test.select{
      |d|
      d[:full_name] == "Mme Caroline Abadie"
    }[0][:email]).to eq("caroline.abadie@assemblee-nationale.fr")
  end
end
