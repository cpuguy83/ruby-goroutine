require 'go-scheduler/extensions'
require 'celluloid'
require 'go-scheduler/worker'

class GoScheduler
  def initialize
    @workers = []
    GOMAXPROCS.times { @workers << Worker.new }
  end

  def schedule_worker(callable_object)
    w = workers.select {|worker| worker.mailbox.size == 0 }[0]
    w = works.shuffle[0] unless w

    w.future.process(callable_object)
  end

  private

  def workers
    @workers
  end
end


GOMAXPROCS ||= 1

GOROUTINE_SCHEDULER = GoScheduler.new
