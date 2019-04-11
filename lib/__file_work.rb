require "json"

# ce fichier nous a servi a sortir les données
# en format json, qui est assez propre

# CRYPTO -------------------------------------
require_relative "./scrap_cryptocurrencies"

json = JSON.pretty_generate(scrap_crypto)
File.open("./lib/_cryptos.json","w") do |f|
  f.write(json)
end
