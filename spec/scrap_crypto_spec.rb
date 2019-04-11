require_relative "../lib/scrap_cryptocurrencies"

describe "the scrap_crypto function" do

  test = scrap_crypto #pour ne pas faire plusieurs requetes

  it "should return a hash" do
    expect(test.class).to eq(Hash)
  end
  
  it "should return more than 500 currencies" do
    expect(test.length > 500).to eq(true)
  end

  it "should return a BTC (bitcoin) with a positive value" do
    expect(test["BTC"] > 0).to eq(true)
  end
end
