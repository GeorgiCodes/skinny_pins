require 'uri'
require "redis"
# require "models/SkinnyUrl"


class WelcomeController < ApplicationController

  def index
    my_class = SkinnyUrl.new
    puts my_class.inspect

    orig_url = "http://www.geekgirl.io/my-very-long-url"
    hash = generateHashFromURL(orig_url)
    shortened_url = shorten(orig_url, hash)
    puts "Shortened url from #{orig_url} to #{shortened_url}"
    my_class.save(hash, orig_url)

    puts my_class.find(hash)
    puts "done"
  end

  def shorten(url_to_shorten, hash)
    base_url = request.host_with_port
    "http://#{base_url}/#{hash}"
  end

  def generateHashFromURL(url_to_shorten)
    # this returns the str as an integer of base 36
    hash = url_to_shorten.to_i(36)
    puts "Generated base 36 int as #{hash}"
    return hash
  end

end
