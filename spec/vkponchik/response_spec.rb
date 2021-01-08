# frozen_string_literal: true

RSpec.describe Vkponchik::Response do
  subject(:response) { described_class.new(data) }

  let(:data) { {} }

  describe '#initialize' do
    it 'allows creation of object' do
      expect { response }.not_to raise_error
    end
  end

  describe '#error?' do
    subject(:result) { response.error? }

    let(:data) { { 'success' => true } }

    it { expect(result).to be(false) }

    context 'when error' do
      let(:data) { { 'success' => false } }

      it { expect(result).to be(true) }
    end
  end

  describe '#error_full_message' do
    subject(:result) { response.error_full_message }

    let(:data) { { 'success' => true } }

    it { expect(result).to be_nil }

    context 'when error' do
      let(:data) { { 'success' => false, 'error' => 1, 'msg' => 'stub' } }

      it { expect(result).to eq('1: stub') }
    end
  end

  describe '#[]' do
    subject(:result) { response[arg] }

    let(:data) { { 'a' => 1 } }
    let(:arg) { 'a' }

    it { expect(result).to be(1) }

    context 'when argument is symbol' do
      let(:arg) { :a }

      it { expect(result).to be(1) }
    end
  end
end
