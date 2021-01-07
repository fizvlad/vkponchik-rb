# frozen_string_literal: true

RSpec.describe Vkponchik::Client do
  subject(:client) { described_class.new(vkponchik_group, vkponchik_token) }
  describe '#initialize' do
    it 'allows creation of client' do
      expect { client }.not_to raise_error
    end
  end
end
