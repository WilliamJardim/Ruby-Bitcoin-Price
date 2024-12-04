require 'net/http'
require 'json'

class Bitcoin
    def initialize(url)
      @url = url
    end

    def verMoeda(consulta, moeda)
        return consulta[moeda]['rate']
    end

    def actual_prices
        consulta = fetch_bitcoin_price()
        
        puts "O preço atual do bitcoin é: "
        puts "      #{ verMoeda(consulta, "USD") } USD"
        puts "      #{ verMoeda(consulta, "GBP") } GBP"
        puts "      #{ verMoeda(consulta, "EUR") } EUR"
    end

    private def fetch_bitcoin_price()
        url = URI(@url)
        response = Net::HTTP.get(url)
        data = JSON.parse(response)

        return data['bpi']
    end
end

Bitcoin.new("https://api.coindesk.com/v1/bpi/currentprice.json").actual_prices