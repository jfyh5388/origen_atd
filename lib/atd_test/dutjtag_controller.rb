module ATDTest
  class DutjtagController
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
    	jtag.read_dr reg
    end

    # As above for write requests
    def write_register(reg, options={})
	jtag.write_dr reg
    end
    
  end
end
