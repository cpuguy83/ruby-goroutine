require 'celluloid/test'
require 'minitest/autorun'
require 'go-scheduler/scheduler'


GOMAXPROCS = 2
class TestWorker < Minitest::Test
  def setup
    Celluloid.shutdown if Celluloid.running?
    Celluloid.boot
  end

  def test_worker_with_empty_mailbox_is_scheduled_first
    s = GoScheduler::Scheduler.new

    s.schedule_worker proc { sleep 0.1; "Test" }
    s.schedule_worker proc { sleep 0.1; "Test" }

    assert_equal [1,1], s.send(:workers).map {|w| w.mailbox.count }
  end

  def test_n_workers_is_set_by_gomaxproc
    s = GoScheduler::Scheduler.new

    assert_equal 2, s.send(:workers).count
  end
end
