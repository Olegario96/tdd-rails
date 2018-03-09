require 'rails_helper'

RSpec.describe 'Customers', type: :request do
  describe 'GET /customers' do
    it 'works! (now write some real specs)' do
      get customers_path
      expect(response).to have_http_status(200)
    end

    it 'index - JSON' do
      get '/customers.json'
      expect(response.body).to include_json([
        name: (be_kind_of String),
        email: (be_kind_of String)
      ])
    end

    it 'show - JSON' do
      get '/customers/1.json'
      expect(response.body).to include_json(
        id: /\d/,
        name: (be_kind_of String),
        email: (be_kind_of String)
      )
    end

    it 'show - JSON' do
      get '/customers/1.json'
      response_body = JSON.parse(response.body)
      expect(response_body.fetch('id')).to eq(1)
    end

    it 'create - JSON' do
      member = create(:member)
      login_as(member, scope: :member)
      headers = {'Accept' => 'application/json'}
      customer_params = attributes_for(:customer)
      post '/customers', params: { customer: customer_params }, headers: headers
      expect(response.body).to include_json(
        id: /\d/,
        name: customer_params.fetch(:name),
        email: customer_params.fetch(:email)
      )
    end

    it 'update - JSON' do
      member = create(:member)
      login_as(member, scope: :member)
      headers = {'Accept' => 'application/json'}
      customer = Customer.all.first
      customer.name += ' Atualizado'
      patch "/customers/#{customer.id}.json", params: { customer: customer.attributes }, headers: headers
      expect(response.body).to include_json(
        name: customer.name,
        email: customer.email
      )
    end

    it 'delete - JSON' do
      member = create(:member)
      login_as(member, scope: :member)
      headers = {'Accept' => 'application/json'}
      customer = Customer.all.first
      delete "/customers/#{customer.id}.json", params: { customer: customer.attributes }, headers: headers
      expect(response).to have_http_status(204)
    end
  end
end
