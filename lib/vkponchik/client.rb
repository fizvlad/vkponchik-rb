# frozen_string_literal: true

require 'net/http'
require 'json'

module Vkponchik
  # API client class
  class Client
    API_VERSION = 1
    API_BASE = 'https://api.keksik.io'
    API_HEADERS = { 'Content-Type' => 'application/json' }.freeze

    # Initialize new client
    # @param group [Integer] group ID
    # @param token [String] group API token
    def initialize(group, token)
      @group = group
      @token = token
    end

    # Send POST request to API server
    # @param method [String] method name
    # @param params [Hash] parameters to pass in POST request
    # @return [Hash]
    def request(method, **params)
      params[:v] = API_VERSION
      params[:group] = @group
      params[:token] = @token

      uri = URI("#{API_BASE}/#{method}")
      re = Net::HTTP.post(uri, params.to_json, API_HEADERS)

      Response.new(JSON.parse(re.body))
    rescue StandardError
      raise Vkponchik::Error, 'Request failure'
    end
  end
end
