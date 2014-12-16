module Rack
  class Redirector

    def initialize(app)
      @app = app
    end

    def call(env)
       url = get_url(env)
       if url.present?
         [301, {'Location' => url}, ['Redirecting...']]
       else
        app.call(env)
      end
    end

    private
    attr_reader :app

    def get_url(env)
     $redis.get(redis_key(env))
    end

    def redis_key(env)
      env['PATH_INFO'].delete('/')
    end
  end
end
