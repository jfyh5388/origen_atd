# lib/nvm/nvm_m682.rb
module NVM
  class NVM_M682
    include Origen::Model

    def initialize(options={})
      case version
      when 3
        sub_block  :analog,         class_name:"ANALOG_T921", base_address: 0x4000_0000, version: 11
        sub_blocks :memory,         instances: 4, version: 12
        sub_block  :state_machine,  version: 20

      when 5
        sub_block  :analog,        class_name:"ANALOG_T921", base_address: 0x4000_0000, version: 12
        sub_blocks :memory,        instances: 4, version: 12
        sub_block  :state_machine, version: 24

      else
        fail "The BOM for version #{version} has not been defined!"
      end
    end

  end
end
