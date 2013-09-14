#!/usr/bin/ruby

require 'open-uri'
require 'json'


10.times do |n|

  contents = URI.parse("https://api.github.com/legacy/repos/search/:java?language=java&start_page=#{n}").read

  result = JSON.parse(contents)

  result.each { |item|
    puts item.url
  }

end
