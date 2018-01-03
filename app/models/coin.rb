class Coin < ApplicationRecord
	belongs_to :collection

	validates :year, presence: true, numericality: true
	validates :country, presence: true
	validates :value, presence: true, inclusion: {in: :value, 
		message: "This type of coin does not exist"}
		
	def self.by_country(c)
		where(country: 'c' )
	end
	

	enum introducedeuro: 
	{
		andorra: 2015,
		austria: 1999,
		belgium: 1999, 
		ciprus: 2008,	
		estonia: 2011, 
		finland: 1999, 
		france: 1999, 
		germany: 1999, 
		greece: 2001,	
		ireland: 1999, 
		italy: 1999, 
		latvia: 2014, 
		lithuania: 2015, 
		luxemburg: 1999, 
		malta: 2007, 
		monaco: 1999,
		netherlands: 1999,	
		portugal: 1999, 
		sanmarino: 1999,
		slovakia: 2008, 
		slovenia: 2007, 
		spain: 1999, 
		vatican: 1999
	}
	
	
	def coin_validator 
		if(year < introduced_euro[:country]) 
			raise  "This country didn't have EURO currency until #{introducedEuro[:country]}"
		end
	end

	# COUNTRIES WITH EURO AS THEIR CURRENCY

	ANDORRA = 0 
	AUSTRIA = 1 
	BELGIUM = 2
	CIPRUS = 3
	ESTONIA = 4 
	FINLAND = 5 
	FRANCE = 6
	GERMANY = 7 
	GREECE = 8	
	IRELAND = 9 
	ITALY = 10 
	LATVIA = 11 
	LITHUANIA = 12
	LUXEMBURG = 13 
	MALTA = 14 
	MONACO = 15 
	NETHERLANDS = 16 
	PORTUGAL = 17
	SANMARINO = 18 
	SLOVAKIA = 19 
	SLOVENIA = 20 
	SPAIN = 21 
	VATICAN = 22 
	

	enum country: {

		Andorra: ANDORRA,
		Austria: AUSTRIA,
		Belgium: BELGIUM, 
		Ciprus: CIPRUS,	
		Estonia: ESTONIA, 
		Finland: FINLAND, 
		France: FRANCE, 
		Germany: GERMANY, 
		Greece: GREECE,	
		Ireland: IRELAND, 
		Italy: ITALY, 
		Latvia: LATVIA, 
		Lithuania: LITHUANIA, 
		Luxemburg: LUXEMBURG, 
		Malta: MALTA, 
		Monaco: MONACO,
		Netherlands: NETHERLANDS,	
		Portugal: PORTUGAL, 
		Sanmarino: SANMARINO,
		Slovakia: SLOVAKIA, 
		Slovenia: SLOVENIA, 
		Spain: SPAIN, 
		Vatican: VATICAN

	}

	ONECENT = 0.01 
	TWOCENT = 0.02
	FIVECENT = 0.05
	TENCENT = 0.1
	TWENTYCENT = 0.2
	FIFTYCENT = 0.5
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

	def constructor(year,country,value) 
		@year = year
		@country = country
		@value = value
	end


	def select_options_tag(name='',select_options={},options={})
	  #set selected from value
	  selected = ''
	  unless options[:value].blank?
	    selected = options[:value]
	    options.delete(:value)
	  end
	  select_tag(name,options_for_select(select_options,selected),options)
	end
end
	
