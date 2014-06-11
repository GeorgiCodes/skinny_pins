require 'uri'

class WelcomeController < ApplicationController

  def index
    orig_url = "http://www.geekgirl.io/my-very-long-url"
    shortened_url = shorten orig_url
    puts "Shortened url from #{orig_url} to #{shortened_url}"
  end

  def shorten(url_to_shorten)
    hash = generateHashFromURL(url_to_shorten)
    base_url = request.host_with_port
    "http://#{base_url}/#{hash}"
  end

  def generateHashFromURL(url_to_shorten)
    hash = url_to_shorten.to_i(36)
    puts "Generated base 36 from #{url_to_shorten} as #{hash}"
    return hash
  end

end
