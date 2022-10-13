p "Where are you located?"

# user_location = gets.chomp

# p user_location

user_location = "Philadelphia"  # workflow improvement to hard-code while we're developing

require "open-uri"

gmaps_api_endpoint = "https://maps.googleapis.com/maps/api/geocode/json?address=Philadelphia&key=AIzaSyAgRzRHJZf-uoevSnYDTf08or8QFS_fb3U"

using_gsub = "https://maps.googleapis.com/maps/api/geocode/json?address=PLACEHOLDER&key=AIzaSyAgRzRHJZf-uoevSnYDTf08or8QFS_fb3U".gsub("PLACEHOLDER",user_location)

using_interpolation = "https://maps.googleapis.com/maps/api/geocode/json?address=#{ user_location}&key=AIzaSyAgRzRHJZf-uoevSnYDTf08or8QFS_fb3U"

raw_data = URI.open(using_gsub).read

# p raw_data.length  -- depending on which locatino you input, positions will change

# p raw_data

# Now we get the latitude/longitude we want out of this mess

require "json"

parsed_data = JSON.parse(raw_data)

p parsed_data.keys  # now time to go fetch results!
results_array = parsed_data.fetch("results")
p results_array.first  # shorthand for p results_array.at(0)

first_result = results_array.at(0)
p first_result.keys
p first_result.fetch("geometry")

geo = first_result.fetch("geometry")

loc = geo.fetch("location")

latitude = loc.fetch("lat")
longitude = loc.fetch("lng")

p latitude
p longitude

#
gp snapshot
