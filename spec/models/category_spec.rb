require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @user = User.create(name: 'Nuri', email: 'test@email', password: 'password')
    @category = Category.new(user: @user, name: 'My title', icon: 'https://cdn-icons-png.flaticon.com/128/2731/2731636.png')
  end

  it 'if all atributes pass validation' do
    expect(@category).to be_valid
  end

  it 'if there is title' do
    @category.name = nil
    expect(@category).not_to be_valid
  end

  it 'if there is max 250 characters' do
    @category.name = 'Testing lenght'
    expect(@category).to be_valid
  end

  it 'if icon url is invalid' do
    @category.icon = nil
    expect(@category).not_to be_valid
  end
end
