module NVM
  class ANALOG_T921
    include Origen::Model
    include CrossOrigen

    bug :low_vref, :affected_version => 11
    bug :low_iref, :affected_versions => [11, 12]
    bug :dac_code, :fixed_on_version => 12
    bug :unfixable

    feature :feature1
    feature :feature2, :description =>"feature2 description, this API for tools"
    # This is feature 3 description, this API is for humans
    # and markdown should be used for formatting
    feature :feature3
    

    def initialize(options={})
	instantiate_registers(options)
    end

    def instantiate_registers(options={})
      reg :ctrl, 0x0024, size: 16, bit_order: :msb0 do |reg|
        reg.bit 8, :coco, access: :ro
        reg.bit 9, :aien
        reg.bit 10, :diff
        reg.bit 11..15, :adch, reset: 0x1F
      end
    end
  end
end
