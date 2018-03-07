require 'rails_helper'

RSpec.describe "Customers", type: :request do
  describe "GET /customers" do
    it "works! (now write some real specs)" do
      get customers_path
      expect(response).to have_http_status(200)
    end

    it "index - json" do
      get '/customers.json'
      expect(response.body).to include_json([
        email: 'my_email_33@email.com'
      ])
    end

    it "show - json" do
      get '/customers/1.json'
      expect(response.body).to include_json(
        id: 1,
        email: 'my_email_33@email.com'
      )
    end
  end
end
