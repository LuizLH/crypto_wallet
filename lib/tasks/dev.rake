namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Apagando BD...', 'Concluído com Sucesso!') {%x(rails db:drop)}
      show_spinner('Criando  BD...') do
        %x(rails db:create)
      end
      show_spinner('Migrando BD...')  {%x(rails db:migrate)}

      %x(rails dev:add_coins)
      %x(rails dev:add_mining_types)
    else
      puts 'Você não está em modo de desenvolvimento'
    end
  end

  desc "Cadastra as Moedas"
  task add_coins: :environment do
    if Rails.env.development?
      show_spinner('Cadastrando Moedas...') do
        coins = [
          {
           description: "Bitcoin",
           acronym: "BTC",
           url_image: "https://img.freepik.com/vetores-premium/simbolo-de-bitcoin-de-moeda-dourada-de-criptografia-isolado-em-fundo-transparente_372769-976.jpg"
          },
      
          {
           description: "Ethereum",
           acronym: "ETH",
           url_image: "https://png.pngtree.com/png-clipart/20210511/ourmid/pngtree-this-is-ethereum-cryptocurrency-vector-illustration-png-image_3279437.jpg"
          },
      
          {
           description: "Dash",
           acronym: "DASH",
           url_image: "https://cryptologos.cc/logos/dash-dash-logo.png"
          },
     
          {
           description: "Iota",
           acronym: "TOT",
           url_image: "https://cryptologos.cc/logos/iota-miota-logo.png"
          },
     
          {
           description: "ZCash",
           acronym: "ZEC",
           url_image: "https://cryptologos.cc/logos/zcash-zec-logo.png"
          }
        ]
     
        coins.each do |coin|
          Coin.find_or_create_by!(coin)
        end
      end  
    else
      puts 'Você não está em modo de desenvolvimento'
    end
  end

  desc "Cadastra os tipos de mineração"
  task add_mining_types: :environment do
    if Rails.env.development?
      show_spinner('Cadastrando tipos de mineração...') do
        mining_types = [
          {description: "Proof of Work", acronym: "PoW"},
          {description: "Proof of Stake", acronym: "PoS"},
          {description: "Proof of Capacity", acronym: "PoC"}
        ]

        mining_types.each do |mining|
          MiningType.find_or_create_by!(mining)
        end        
      end
    else
      puts 'Você não está em modo de desenvolvimento'
    end
  end

  private

  def show_spinner(msg_start, msg_end = 'Concluído!') 
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
 
  end
    
end