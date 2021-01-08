# frozen_string_literal: true

require 'net/http'
require 'json'

module Vkponchik
  # API client class
  class Client
    API_VERSION = 1
    API_BASE = 'https://api.vkdonuts.ru'
    API_HEADERS = { 'Content-Type' => 'application/json' }.freeze
    API_METHODS = [
      'donates/get', 'donates/change-status', 'donates/answer', 'donates/change-reward-status',
      'campaigns/get', 'campaigns/get-active', 'campaigns/get-rewards', 'campaigns/change',
      'campaigns/change-reward', 'payments/get', 'payments/create', 'balance'
    ].freeze

    # Initialize new client
    # @param group [Integer] group ID
    # @param token [String] group API token
    def initialize(group, token)
      @group = group
      @token = token
    end

    # Send POST request to API server
    # @param method [String] see {API_METHODS} array
    # @param params [Hash] parameters to pass in POST request
    # @return [Hash]
    def request(method, **params)
      validate_request_options(method, **params)

      params[:v] = API_VERSION
      params[:group] = @group
      params[:token] = @token

      uri = URI("#{API_BASE}/#{method}")
      re = Net::HTTP.post(uri, params.to_json, API_HEADERS)

      JSON.parse(re.body)
    rescue StandardError
      raise Vkponchik::Error, 'Request failure'
    end

    private

    def validate_request_options(method, **_params)
      raise Vkponchik::Error, 'Invalid request method' unless API_METHODS.include?(method)
    end
  end
end
