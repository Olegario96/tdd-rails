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
    it 'respond as http 200' do
      member = create(:member)
      customer = create(:customer)
      sign_in(member)
      get :show, params: { id: customer.id }
      expect(response).to have_http_status(200)
    end

    it 'render a :show template' do
      member = create(:member)
      customer = create(:customer)
      sign_in(member)
      get :show, params: { id: customer.id }
      expect(response).to render_template(:show)
    end
  end
end
