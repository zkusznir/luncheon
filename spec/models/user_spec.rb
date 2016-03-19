require 'rails_helper'

describe User do
  let(:user) { create(:user) }

  it 'has a valid factory' do
    expect(user).to be_valid
  end

  it 'is invalid without uid' do
    user.uid = nil
    expect(user).to be_invalid
  end

  it 'is invalid without name' do
    user.name = nil
    expect(user).to be_invalid
  end
end
