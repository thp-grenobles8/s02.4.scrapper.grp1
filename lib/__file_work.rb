require "json"

# ce fichier nous a servi a sortir les données
# en format json, qui est assez propre

# # CRYPTO -------------------------------------
# require_relative "./scrap_cryptocurrencies"
#
# json = JSON.pretty_generate(scrap_crypto)
# File.open("./lib/_cryptos.json","w") do |f|
#   f.write(json)
# end


# # DEPUTIES -------------------------------------
# require_relative "./scrap_deputies"
#
# json = JSON.pretty_generate(get_deputies)
# File.open("./lib/_deputies.json","w") do |f|
#   f.write(json)
# end


# tests sur les donnees ---------------------------

json = JSON.parse(File.read("./lib/_deputies.json"))
print json.select{
  |i|
  puts i; i[:full_name] == "Mme Caroline Abadie"
} #[0][:email]

puts json[0].each do |k,v|
  puts k
  puts "v : #{v}"
end
