require 'rails_helper'

describe Meal do
  let(:meal) { create(:meal) }

  it 'has a valid factory' do
    expect(meal).to be_valid
  end

  it 'is invalid without name' do
    meal.name = nil
    expect(meal).to be_invalid
  end

  it 'is invalid without price' do
    meal.price = nil
    expect(meal).to be_invalid
  end

  it 'is invalid without user' do
    meal.user_id = nil
    expect(meal).to be_invalid
  end

  it 'is invalid without order' do
    meal.order_id = nil
    expect(meal).to be_invalid
  end

  it 'can be assigned to the same user within an order only once' do
    meal
    expect(Order.all.count).to eq 1
    meal
    expect(Order.all.count).to eq 1
  end
end
