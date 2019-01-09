module ATDTest
  class Falcon
    include Origen::TopLevel
    include CrossOrigen

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
      add_pins :port_a, size: 8
    end

    def instantiate_registers(options = {})
    end

    def instantiate_sub_blocks(options = {})
      case version
      when 0
        sub_block :nvm, class_name: "NVM::NVM_M682", version: 3
      when 1
        sub_block :nvm, class_name: "NVM::NVM_M682", version: 5
      else
        fail "The BOM for version #{version} has not been defined!"
      end
      sub_block :atd, instances: 2, class_name: 'ATD',
	  base_address: [0x1000_0000, 0x1000_1000]
    end
  end
end
