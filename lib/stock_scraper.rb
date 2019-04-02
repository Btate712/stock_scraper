require "stock_scraper/version"
require 'nokogiri'
require 'open-uri'

module StockScraper
  class Error < StandardError; end

  puts "Enter stock ticker to lookup:"
  ticker = gets.strip
  url = "https://www.wsj.com/search/term.html?KEYWORDS=#{ticker}"
  html = open(url)
  doc = Nokogiri::HTML(html)
  puts "Last Price:  #{doc.css('p.last').text}"
  puts "Would you like more info? (y/n):"
  if gets.strip.downcase == "y"
    puts "High: #{doc.css('p.high').text}"
    puts "Low: #{doc.css('p.low').text}"
    puts "Volume: #{doc.css('p.volume')[0].text}"
  end
end
