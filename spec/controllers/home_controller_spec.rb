require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #finance" do
    it "returns http success" do
      get :finance
      expect(response).to have_http_status(:success)
    end
  end

end
