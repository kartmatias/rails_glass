require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let!(:user) { create(:user) }
  let(:user_id) { user_id }

  describe "GET /users/:id" do
    before do
      headers = { "Accept"  => "application/vnd.glass.v1"}
      get "/users/#{}user_id}", {}, headers
    end

    context "quando usuario existir no banco" do
      it "retorna o usuario" do
        user_response = JSON.parse(response.body)
        expect(user_response["id"]).to eq(user_id)
      end
    end

  end
end