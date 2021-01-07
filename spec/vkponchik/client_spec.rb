# frozen_string_literal: true

RSpec.describe Vkponchik::Client do
  subject(:client) { described_class.new(vkponchik_group, vkponchik_token) }

  describe '#initialize' do
    it 'allows creation of client' do
      expect { client }.not_to raise_error
    end
  end

  describe '#request' do
    subject(:result) { client.request(method, **params) }

    let(:method) { '' }
    let(:params) { {} }

    context 'when getting all donations' do
      let(:method) { 'donates/get' }

      it 'do not raise errors and return parsed JSON' do
        expect { result }.not_to raise_error
        expect(result).to be_a(Hash)
      end
    end
  end
end
