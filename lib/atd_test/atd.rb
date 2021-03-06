module ATDTest
  class ATD
    include Origen::Model
    include CrossOrigen

    def initialize(options = {})
      cr_import(path: "#{Origen.root}/ipxact/atd.xml")
      instantiate_registers(options)
      instantiate_sub_blocks(options)
    end

    def instantiate_registers(options = {})
      reg :sc4, 0x0, size: 32 do |reg|
	reg.bit 7, :coco, access: :ro
	reg.bit 6, :aien
	reg.bit 5, :diff
	reg.bit 4..0, :adch
      end

      reg :r2, 0x10, size: 32 do |reg|
	reg.bit 15..0, :d
      end

    end

    def instantiate_sub_blocks(options = {})
    end
  end
end
