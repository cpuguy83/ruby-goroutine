require 'celluloid/test'
require 'minitest/autorun'
require 'go-scheduler/worker'


class TestWorker < Minitest::Test
  def setup
    Celluloid.shutdown if Celluloid.running?
    Celluloid.boot
  end

  def test_takes_objects_that_respond_to_call
    worker = GoScheduler::Worker.new
    f = worker.process proc { "test" }
    assert_equal "test", f
  end
end
