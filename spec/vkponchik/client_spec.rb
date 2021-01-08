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

    context 'when gibberish' do
      let(:method) { 'gibberish' }

      it 'raises error' do
        expect { result }.to raise_error(Vkponchik::Error)
      end
    end

    context 'when donates/get' do
      let(:method) { 'donates/get' }

      it 'do not raise errors and return parsed JSON', :aggregate_failures do
        expect { result }.not_to raise_error
        expect(result).to be_a(Vkponchik::Response)
      end
    end

    context 'when client with wrong credentials' do
      let(:client) { described_class.new(1, 'test') }
      let(:method) { 'donates/get' }

      it 'returnes response with error', :aggregate_failures do
        expect { result }.not_to raise_error
        expect(result).to be_a(Vkponchik::Response)
      end
    end
  end
end
