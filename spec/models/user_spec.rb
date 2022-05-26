require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User model' do
    before(:each) do
      @user = User.new(name: 'Nuri', email: 'nuri@gmail.com', password: 'password')
    end

    before { @user.save }

    it 'name must not be blank' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'email must not be blank' do
      @user.email = ''
      expect(@user).to_not be_valid
    end

    it 'password must not be blank' do
      @user.password = ''
      expect(@user).to_not be_valid
    end
  end
end
