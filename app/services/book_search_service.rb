require 'net/http'
require 'uri'
require 'json'

class BookSearchService
  BASE_URL = 'http://localhost:5001/search-books'

  def initialize(query)
    @query = query
  end

  def call
    uri = URI(BASE_URL)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.path, { 'Content-Type' => 'application/json' })
    request.body = { query: @query }.to_json

    begin
      response = ''
      http.request(request) do |streamed_response|
        streamed_response.read_body do |chunk|
          yield chunk if block_given?

          response += chunk
        end
      end
      response
    rescue StandardError => e
      Rails.logger.error("Error in BookSearchService: #{e.message}")
      { error: "An error occurred while calling the Book Search service: #{e.message}" }.to_json
    end
  end
end

