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

      mem_aps = { ahbap: 0x0000_0000 }
      std_memap_config = { latency: 24, apreg_access_wait: 20, apmem_access_wait: 20, csw_reset: 0x23000040 }
      mem_aps = {
        ahbap:  { base_address: 0x00000000 }.merge(std_memap_config)
      }
      aps = {
        mdmap:  { class_name: 'ARMDebugNXP::MDMAP', base_address: 0x0100_0000, apreg_access_wait: 8 }
      }
      sub_block :arm_debug, class_name: 'OrigenARMDebug::DAP', base_address: 0, mem_aps: mem_aps, aps: aps
      arm_debug.mdmap.add_reg(:testmode, 0x8, 32)

    end
  end
end
