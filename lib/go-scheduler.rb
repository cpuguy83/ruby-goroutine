require 'go-scheduler/core_ext'
require 'go-scheduler/scheduler'

GOMAXPROCS ||= 1
Goscheduler.NewScheduler
