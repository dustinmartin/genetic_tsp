require 'rubygems'
require 'geokit'

class City < Geokit::LatLng
	attr_accessor :city_name
	
	def initialize city_name, lat, lng
		@city_name = city_name
		@lat = lat
		@lng = lng
	end

	def to_s
		return "'#{@city_name}'"
	end

end
