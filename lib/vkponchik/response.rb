# frozen_string_literal: true

module Vkponchik
  # API response
  class Response
    # @param hash [Hash]
    def initialize(hash)
      @hash = hash
    end

    # @return [Boolean]
    def error?
      !@hash['success']
    end

    # @return [Boolean]
    def success?
      !error?
    end

    # @return [String?]
    def error_full_message
      return unless error?

      "#{@hash['error']}: #{@hash['msg']}"
    end

    # @return [Object?]
    def [](arg)
      @hash[arg.to_s]
    end
  end
end
