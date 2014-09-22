require 'test_helper'

class TestCoreExt < Minitest::Test
  class CallableObj
    def call
      "test"
    end
  end

  def setup
    Celluloid.shutdown
    Celluloid.boot
  end

  def test_go_takes_block
    GoScheduler.NewScheduler
    f = go { "Test" }
    assert_equal "Test", f.value
  end

  def test_go_takes_proc
    GoScheduler.NewScheduler
    f = go proc { "Test" }
    assert_equal "Test", f.value
  end

  def test_go_takes_callable_object
    GoScheduler.NewScheduler
    f = go CallableObj.new
    assert_equal "test", f.value
  end
end
