require "json"

class SkinnyUrl

  attr_reader :orig_url, :id
  attr_accessor :count

  def self.find(id)
    result = ReadCache.redis.get(id)
    result_hash = JSON.parse(result)
    args = {}
    args["url"] = result_hash["url"]
    args["id"] = id
    args["count"] = result_hash["count"]

    SkinnyUrl.new(args)
  end

  def initialize(args={})
    @orig_url = args["url"] || ""
    @id = args["id"] unless !args["id"]
    @id ||= init_id
    @count = args["count"] || 0

    puts "#{self.inspect}"
  end

  def save
    value = {:url => @orig_url, :count => @count}
    ReadCache.redis.set(@id, value.to_json)
  end

  def init_id
    @id = Array.new(6){ rand(36).to_s(36) }.join
    puts "Generated base 36 int as #{@id}"
    @id
  end
end