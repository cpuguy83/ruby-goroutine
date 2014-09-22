require 'test_helper'

class TestWorker < Minitest::Test
  def setup
    Celluloid.shutdown
    Celluloid.boot
  end

  def test_takes_objects_that_respond_to_call
    worker = GoScheduler::Worker.new
    f = worker.process proc { "test" }
    assert_equal "test", f
  end
end
