class SkinnyUrl

  def save(hash, orig_url)
    ReadCache.redis.set(hash, orig_url)
  end

  def find(hash)
    ReadCache.redis.get(hash)
  end

end