module ATDTest
  class Eagle
    include Origen::TopLevel
    include OrigenSWD
    def initialize(options = {})
      instantiate_pins(options)
      instantiate_registers(options)
      instantiate_sub_blocks(options)
    end

    def instantiate_pins(options = {})
    	add_pin :tclk
      	add_pin :tdi
      	add_pin :tdo
      	add_pin :tms
      	add_pin :resetb
	add_pin :swd_clk 
    	add_pin :swd_dio
      	add_pins :port_a, size: 8
    end

    def instantiate_registers(options = {})
    end

    def instantiate_sub_blocks(options = {})
      sub_block :atd, instances: 2, class_name: 'ATD'
       mem_aps = {
      mem_ap: { base_address: 0x00000000 },
      mem2_ap: { base_address: 0x10000000 }
    }
    sub_block :arm_debug, class_name: 'OrigenARMDebug::DAP', mem_aps: mem_aps                    
    end
  end
end
