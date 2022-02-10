require 'rails_helper'

RSpec.describe UpdateSkuJob, type: :job do
  it "it calls sku service with the correct params" do
    allow(Net::HTTP).to receive(:start).and_return(true)
    described_class.perform_now('Eloquent Ruby')
  end
end
