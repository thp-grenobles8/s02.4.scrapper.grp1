# require 'rubygems'
require 'nokogiri'
require 'open-uri'

# j'ai pris le parti d'extraire chaque ligne
# puis de la RESCANNER via Nokogiri
# pour en extraire les information que je souhaitait

def scrap_crypto
  url = "https://coinmarketcap.com/all/views/all/"

  puts "requesting #{url} ..."
  page = Nokogiri::HTML(open(url))

  puts "... parsing the results ..."
  crypto_dict = {} #dictionnary
  count = 0
  page.search("//tbody//tr").each {
    |row|
    #puts node.to_html
    symbol = Nokogiri::HTML(row.to_html)
    .search("//a[@class=\"link-secondary\"]")[0].text

    price = Nokogiri::HTML(row.to_html)
    .search(".price")[0].text
    #.search("//a[@class=\"price\"]")[0].text

    crypto_dict[symbol] = price[1..-1].to_f

    if count%100 == 0
      puts "scrapped " + count.to_s + " currencies"
      puts "---last : #{symbol} : $#{}"
    end

    count += 1
  }

  puts "...DONE"
  puts "#{count} lignes scrappées"
  puts "#{crypto_dict.keys.length} valeurs récupérées"
  return crypto_dict
end
