module ATDTest
  class EagleController
    include Origen::Controller
    #include OrigenSWD

    def startup(options)
      pp 'Enter test mode' do
        tester.set_timeset('func_25mhz', 40)   # Where 40 is the period in ns
	pin(:tclk).drive!(1)
        pin(:resetb).drive!(1)
	tester.wait time_in_us: 100
      end
    end

    def shutdown(options)
      pp 'Reset the device' do
        pin(:resetb).drive!(0)
        pin(:tclk).drive!(0)
      end
    end

    def read_register(reg, options={})
    	arm_debug.mem_ap.read_register(reg, options)
    end

    # As above for write requests
    def write_register(reg, options={})
    	arm_debug.mem_ap.write_register(reg, options)
    end
    
  end
end
