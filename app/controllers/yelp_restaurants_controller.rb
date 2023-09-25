require 'net/http'

class YelpRestaurantsController < ApplicationController
  def search
    begin
      # Parameters
      term = params[:term]
      attributes = params[:attributes] 
      open_now = params[:open_now]
      sort_by = params[:sort_by] 
      longitude = params[:longitude]
      latitude = params[:latitude]

      uri = URI("https://api.yelp.com/v3/businesses/search")
      uri.query = URI.encode_www_form(
        term: term,
        longitude: longitude,
        latitude: latitude, # Use 'location' or 'latitude' and 'longitude', still deciding
        attributes: attributes,
        open_now: open_now,
        sort_by: sort_by,
        limit: 10
      )

      # HTTP object
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      # Create a GET request with the necessary headers, including the 'Authorization' header
      request = Net::HTTP::Get.new(uri)
      request['Authorization'] = "#{ENV['YELP_API_KEY']}"

      # Send the request and get the response
      response = http.request(request)
      puts "Yelp API Response: #{response.body}"

      if response.is_a?(Net::HTTPSuccess)
        # Parse and send the Yelp API response to the frontend
        render json: JSON.parse(response.body)
      else
        # Handle the case where the response is not successful
        render json: { error: 'Yelp API request failed' }, status: :bad_request
      end

    rescue StandardError => e
      render json: { error: e.message }, status: :internal_server_error
    end
  end
end
