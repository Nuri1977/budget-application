require 'rails_helper'

RSpec.describe 'Testing payments views', type: :feature do
  before(:each) do
    @user = User.create(name: 'Test', email: 'text@example.com', password: '123456')
    @category = Category.create(name: 'Test category',
                                icon: 'https://cdn-icons-png.flaticon.com/128/2731/2731636.png', user: @user)
    @payment = Payment.create(name: 'Test payment', amount: 200, category: @category)

    visit new_user_session_path
    find('#email').set @user.email
    find('#floating_password').set @user.password
    click_on 'Log in'
    visit category_path(@category.id)
    click_link('New Transaction')
  end

  describe 'payments#new' do
    it 'When adding data to form and sucessufully submits' do
      find('#name').set 'bananas'
      find('#amount').set 50
      click_on 'Submit'
      expect(page).to have_content 'bananas'
      expect(page).to have_content('$50.0')
    end
  end
end
