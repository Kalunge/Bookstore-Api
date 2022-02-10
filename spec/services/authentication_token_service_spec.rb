require 'rails_helper'

describe AuthenticationTokenService do
  describe '.encode' do
    it "returns an authentication token" do
      expect(described_class.encode).to eq("123")
    end
  end
end