class SpaceCat
	include DataMapper::Resource
	property :id, Serial
	property :name, String
	property :home_planet, String
	property :tagline, String
	property :superpower, String
	property :created_at, DateTime
	property :updated_at, DateTime
end