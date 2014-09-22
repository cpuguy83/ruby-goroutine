require 'test_helper'
require 'go-scheduler/worker'

class GoScheduler
  def self.NewScheduler
    @scheduler = GoScheduler::Scheduler.new
  end

  def self.scheduler
    @scheduler
  end

  class Scheduler
    def initialize
      @workers = []
      GOMAXPROCS.times { @workers << GoScheduler::Worker.new }
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
end
