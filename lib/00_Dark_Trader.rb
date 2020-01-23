require 'rubygems'
require 'nokogiri'
require 'open-uri'
   
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
symbols = []
prices = []

page.xpath('//td[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol"]').each do |symbol|
  
  symbols << symbol.text
end



page.xpath('//td[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"]').each do |price|

 
  prices << price.text

end


hashed = Hash[symbols.zip prices]

puts hashed