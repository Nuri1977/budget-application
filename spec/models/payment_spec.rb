require 'rails_helper'

RSpec.describe Payment, type: :model do
  before(:each) do
    @user = User.create(name: 'Nuri', email: 'test@email', password: 'password')
    @category = Category.create(user: @user, name: 'My title', icon: 'https://cdn-icons-png.flaticon.com/128/2731/2731636.png')
    @payment = Payment.create(category: @category, name: 'My pyment', amount: 35)
  end

  it 'if all atributes pass validation' do
    expect(@payment).to be_valid
  end

  it 'if there is title' do
    @payment.name = nil
    expect(@payment).not_to be_valid
  end

  it 'if there is max 250 characters' do
    @payment.name = 'Testing lenght'
    expect(@payment).to be_valid
  end

  it 'if payment amount is invalid' do
    @payment.amount = nil
    expect(@payment).not_to be_valid
  end

  it 'if payment amount is number' do
    @payment.amount = 'not a number'
    expect(@payment).not_to be_valid
  end
end
