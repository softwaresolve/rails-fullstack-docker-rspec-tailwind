# frozen_string_literal: true

# RedisConn
module RedisConn
  def self.current
    @redis ||= Redis.new(url: ENV.fetch('REDIS_URL'))
  end
end
