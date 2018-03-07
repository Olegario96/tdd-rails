require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  it 'responds successfully' do
    get :index
    expect(response).to be_success
  end

  it 'respond as http 200' do
    get :index
    expect(response).to have_http_status(200)
  end
end
