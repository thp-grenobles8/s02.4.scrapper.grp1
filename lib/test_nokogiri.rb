# require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://ruby.bastardsbook.com/chapters/html-parsing/"))
puts page.class   # => Nokogiri::HTML::Document

puts page.css("span")[0].text
puts page.css("a")[0]["href"]
