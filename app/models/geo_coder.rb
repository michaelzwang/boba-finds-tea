require 'net/http'
require 'uri'

module GeoCoder
  extend self

  def update_post_with_coordinates(post)
    params = build_params_for_post(post)
    google_maps_url = 'https://maps.googleapis.com/maps/api/geocode/json'
    encoded_url = URI.encode(google_maps_url + "?" + params)
    url = URI.parse(encoded_url)
    response = Net::HTTP.get(url)
    parsed_response = JSON.parse(response)

    post.lat = parsed_response["results"][0]["geometry"]["location"]["lat"].to_f
    post.lng = parsed_response["results"][0]["geometry"]["location"]["lng"].to_f

    puts "////////////////"
    puts parsed_response["results"][0]["geometry"]["location"]["lat"].to_f
    puts parsed_response["results"][0]["geometry"]["location"]["lng"].to_f
    puts post.lat
    puts post.lng
  end

  def build_params_for_post(post)
    location_data = [post.street, post.city]
    location_data.map! {|string| string.gsub(/\W/, "%") }

    "address=#{location_data.join("%")}"
  end

end
