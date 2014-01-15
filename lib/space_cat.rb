class SpaceCat
	include DataMapper::Resource
	attr_accessor :name, :home_planet, :tagline, :superpower
	property :id, Serial
	property :name, String
	property :home_planet, String
	property :tagline, String
	property :superpower, String
	property :created_at, DateTime
	property :updated_at, DateTime
end