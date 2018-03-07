require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  describe 'as a guest' do
    context '#index' do
      it 'responds successfully' do
        get :index
        expect(response).to be_success
      end

      it 'respond as http 200' do
        get :index
        expect(response).to have_http_status(200)
      end
    end

    it 'respond as http 302' do
      customer = create(:customer)
      get :show, params: { id: customer.id }
      expect(response).to have_http_status(302)
    end
  end

  describe 'as logged member' do
    before do
      @member = create(:member)
      @customer = create(:customer)
    end

    it 'Content-type JSON' do
      customer_params = attributes_for(:customer)
      sign_in(@member)
      post :create, format: :json, params: { customer: customer_params }
      expect(response.content_type).to eq('application/json')
    end

    it 'flash notice' do
      customer_params = attributes_for(:customer)
      sign_in(@member)
      post :create, params: { customer: customer_params }
      expect(flash[:notice]).to match(/successfully created/)
    end

    it 'with valid attributes' do
      customer_params = attributes_for(:customer)
      sign_in(@member)
      expect{
        post :create, params: { customer: customer_params }
      }.to change(Customer, :count).by(1)
    end

    it 'respond as http 200' do
      sign_in(@member)
      get :show, params: { id: @customer.id }
      expect(response).to have_http_status(200)
    end

    it 'render a :show template' do
      sign_in(@member)
      get :show, params: { id: @customer.id }
      expect(response).to render_template(:show)
    end
  end
end
