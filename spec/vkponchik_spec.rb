# frozen_string_literal: true

RSpec.describe Vkponchik do
  it 'has a version number' do
    expect(Vkponchik::VERSION).not_to be nil
  end

  it 'has test group ID and token defined', :aggregate_failures do
    expect(vkponchik_group).to be_a(Integer)
    expect(vkponchik_token).to be_a(String)
  end
end
