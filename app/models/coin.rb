class Coin < ApplicationRecord
	validates :year, presence: true
	validates :value, presence: true
	
	# COUNTRIES WITH EURO AS THEIR CURRENCY

	ANDORRA = 0 # introduced in 2015
	AUSTRIA = 1 # introduced in 1999
	BELGIUM = 2 # introduced in 1999
	CIPURS = 3 # introduced in 2008
	ESTONIA = 4 # introduced in 2011
	FINLAND = 5 # introduced in 1999
	FRANCE = 6 # introduced in 1999
	GERMANY = 7 # introduced in 1999
	GREECE = 8	# introduced in 2001
	IRELAND = 9 # introduced in 1999
	ITALY = 10 # introduced in 1999
	LATVIA = 11 # introduced in 2014
	LITHUANIA = 12 # introduced in 2015
	LUXEMBURG = 13 # introduced in 1999
	MALTA = 14 # introduced in 2007
	MONACO = 15 # introduced in 1999
	NETHERLANDS = 16 # introduced in 1999
	PORTUGAL = 17 # introduced in 1999
	SANMARINO = 18 # introduced in 1999
	SLOVAKIA = 19 # introduced in 2008
	SLOVENIA = 20 # introduced in 2007
	SPAIN = 21 # introduced in 1999
	VATICAN = 22 # introduced in 1999
	

	enum country: {

		andorra: ANDORRA,
		austria: AUSTRIA,
		belgium: BELGIUM, 
		ciprus: CIPRUS,	
		estonia: ESTONIA, 
		finland: FINLAND, 
		france: FRANCE, 
		germany: GERMANY, 
		greece: GREECE,	
		ireland: IRELAND, 
		italy: ITALY, 
		latvia: LATVIA, 
		lithuania: LITHUANIA, 
		luxemburg: LUXEMBURG, 
		malta: MALTA, 
		monaco: MONACO,
		netherlands: NETHERLANDS,	
		portugal: PORTUGAL, 
		sanmarino: SANMARINO,
		slovakia: SLOVAKIA, 
		slovenia: SLOVENIA, 
		spain: SPAIN, 
		vatican: VATICAN

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
