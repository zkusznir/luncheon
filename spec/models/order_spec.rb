require 'rails_helper'

describe Order do
  let(:order) { create(:order) }

  it 'has a valid factory' do
    expect(order).to be_valid
  end

  it 'is invalid without restaurant_name' do
    order.restaurant_name = nil
    expect(order).not_to be_valid
  end

  it 'is invalid without status' do
    order.status = nil
    expect(order).not_to be_valid
  end

  it 'is invalid with strange status' do
    order.status = 'Any'
    expect(order).not_to be_valid
  end

  context 'when actove/history scope is involved' do
    before(:each) do
      2.times { create(:order) }
      2.times { create(:order, status: 'Finalized') }
    end

    it 'returns finalized orders within history scope' do
      expect(Order.history.count).to eq 2
    end

    it 'returns opened, ordered and delivered orders within active scope' do
      expect(Order.active.count).to eq 2
    end
  end
end
