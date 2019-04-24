module ATDTest
  class ATDController
    include Origen::Controller
  
    def convert(channel)
	 ss 'Perfoming an ATD conversion on channel   #{channel}'
	 cc 'Begin of sc1.adch.write!(#{channel})'
	 sc1.adch.write!(channel)
	 cc 'End of sc1.adch.write!(#{channel})'
	 cc 'Begin of wait 100us'
	 tester.wait time_in_us: 100
	 cc 'End of wait 100us'
         cc 'Begin of sc1.coco.assert!(1})'
	 sc1.coco.assert!(1)
	 cc 'End of sc1.coco.assert!(1})'
	 cc 'Begin of r.d'
	 r.d # Return the result bits
	 cc 'End of r.d'
    end
  end
end
