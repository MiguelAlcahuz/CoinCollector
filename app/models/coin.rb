class Coin < ApplicationRecord
  has_and_belongs_to_many :collections
  validates :year, presence: true
  validates :country, presence: true
  validates :value, presence: true    
  validate :year_validator

  def self.introduced_euro(country) 
    country_introduction_years = {
      "andorra": 2015,
      "austria": 1999,
      "belgium": 1999, 
      "ciprus": 2008, 
      "estonia": 2011, 
      "finland": 1999, 
      "france": 1999, 
      "germany": 1999, 
      "greece": 2001, 
      "ireland": 1999, 
      "italy": 1999, 
      "latvia": 2014, 
      "lithuania": 2015, 
      "luxemburg": 1999, 
      "malta": 2007, 
      "monaco": 1999,
      "netherlands": 1999,  
      "portugal": 1999, 
      "sanmarino": 1999,
      "slovakia": 2008, 
      "slovenia": 2007, 
      "spain": 1999, 
      "vatican": 1999
    }
    country_introduction_years.each do |k, v| 
      if country.eql?(k.to_s) 
        return v 
     end
    end
  end
  
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

  def self.get_coin_value(val) 
    values.each { |k,v| if val.eql?(k)
        return v
      end
    }
  end

  def year_is_valid?
    year && year >= Coin.introduced_euro(country) && year <= Date.current.year
  end

  def year_validator
    errors.add(:year, "year is not permitted") unless year_is_valid?
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
  
