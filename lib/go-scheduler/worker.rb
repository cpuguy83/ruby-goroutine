require 'celluloid'
require 'celluloid/io'

class GoScheduler
  class Worker
    include Celluloid::IO

    def process(callable_object)
      callable_object.call
    rescue => e
      return abort(e)
    end
  end
end
