module Kernel
  def go(callable_object=nil, &block)
    obj = callable_object || block
    GOROUTINE_SCHEDULER.schedule_worker(obj)
  end
end
