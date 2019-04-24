module ATDTest
  class FalconController
    include Origen::Controller
    include OrigenNexus
    

    def startup(options)
      #pp 'Enter test mode' do
	cc 'Enter test mode'
        tester.set_timeset('func_25mhz', 40)   # Where 40 is the period in ns
	cc 'Begin of tclk drive 1'
        pin(:tclk).drive!(1)
	cc 'End of tclk drive 1'
	cc 'Begin of resetb drive 1'
        pin(:resetb).drive!(1)
	cc 'End of resetb drive 1'
        tester.wait time_in_us: 100
      #end
    end

    def shutdown(options)
      pp 'Reset the device' do
        pin(:resetb).drive!(0)
        pin(:tclk).drive!(0)
      end
    end

    def write_register(reg, options={})
	nexus.write_register(reg, options)
    end

    def read_register(reg, options={})
	nexus.read_register(reg, options)
    end

  end
end
