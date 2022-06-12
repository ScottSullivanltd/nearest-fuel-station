class Station
  attr_reader :name, :address, :fuel_type, :access_times, :distance, :travel_time, :directions

  def initialize(attr)
    @name = attr[:station_name]
    @address = [
      attr[:street_address],
      attr[:city],
      attr[:state],
      attr[:zip]
    ].join(", ")
    # can also do this.. @full_address = "#{@address} #{@city}, #{@state} #{@zip}"
    @fuel_type = attr[:fuel_type]
    @access_times = attr[:access_days_time]
    @distance = "#{attr[:distance]} miles"
    @travel_time = Time.at(attr[:travel_time]).utc.strftime("%H:%M:%S")
    @directions = attr[:directions]
  end
end
