require 'rails_helper'

RSpec.describe '/payments', type: :request do
  before(:each) do
    @user = User.create(name: 'Test', email: 'text@example.com', password: '123456')
    @category = Category.create(name: 'Test category',
                                icon: 'https://cdn-icons-png.flaticon.com/128/2731/2731636.png', user: @user)
    @payment = Payment.create(name: 'Test payment', amount: 200, category: @category)

    post user_session_path, params: { user: { email: @user.email, password: @user.password } }
    get root_path
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get payments_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get payment_url(@payment)
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      get edit_payment_url(@payment)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders correct content' do
      expect(response.body).to include('Test category')
    end
  end
end
