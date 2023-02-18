# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Inserindo moedas..."

Coin.create!(
    description: "Bitcoin",
    acronym: "BTC",
    url_image: "https://img.freepik.com/vetores-premium/simbolo-de-bitcoin-de-moeda-dourada-de-criptografia-isolado-em-fundo-transparente_372769-976.jpg"
 )
 
 Coin.create!(
    description: "Ethereum",
    acronym: "ETH",
    url_image: "https://png.pngtree.com/png-clipart/20210511/ourmid/pngtree-this-is-ethereum-cryptocurrency-vector-illustration-png-image_3279437.jpg"
 )
 
 Coin.create!(
    description: "Tether",
    acronym: "USDT",
    url_image: "https://logospng.org/wp-content/uploads/tether.png"
 )

 puts "Moedas criadas com sucesso..."