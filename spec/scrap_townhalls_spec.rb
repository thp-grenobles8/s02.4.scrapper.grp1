require_relative "../lib/scrap_townhalls"

describe "the get_email function" do
  it "should return valid emails" do
    expect(get_email(
      "https://www.annuaire-des-mairies.com/95/amenucourt.html"
      )).to eq("mairie.amenucourt@wanadoo.fr")
    expect(get_email(
      "https://www.annuaire-des-mairies.com/95/fremecourt.html"
      )).to eq("mairiefremecourt@orange.fr")
    expect(get_email(
      "https://www.annuaire-des-mairies.com/95/osny.html"
      )).to eq("communication@ville-osny.fr")
  end
end


describe "the get_emails_val_d_oise function" do

  test = get_emails_val_d_oise #pour ne pas faire plusieurs requetes

  it "should return a hash" do
    expect(test.class).to eq(Hash)
  end

  it "should return more than 100 currencies" do
    expect(test.length > 100).to eq(true)
  end

  it "should return some valid emails " do
    expect(test["ABLEIGES"]).to eq("mairie.ableiges95@wanadoo.fr")
    expect(test["AUVERS SUR OISE"]).to eq("communication@auvers-sur-oise.com")
    expect(test["PONTOISE"]).to eq("mairie@ville-pontoise.fr")
  end
end
