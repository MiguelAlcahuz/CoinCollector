class Coin < ApplicationRecord
	validates :year, presence: true
	validates :value, presence: true
	


	yearArray = Array.new
	for i in 1999..Date.current.year
		yearArray << i.to_s
	end

	enum country: {

	}

	ONECENT = 0,01 
	TWOCENT = 0,02
	FIVECENT = 0,05
	TENCENT = 0,1
	TWENTYCENT = 0,2
	FIFTYCENT = 0,5
	ONEEURO = 1
	TWOEURO = 2

	enum value: {
		onecent: ONECENT,
		twocent: TWOCENT,
		fivecent: FIVECENT,
		tencent: TENCENT,
		twentycent: TWENTYCENT,
		fiftycent: FIFTYCENT,
		oneeuro: ONEEURO,
		twoeuro: TWOEURO
	}
end
