module Kernel
  def go(callable_object=nil, &block)
    obj = callable_object || block
    GoScheduler.scheduler.schedule_worker(obj)
  end
end
