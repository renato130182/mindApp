require 'rails_helper'

RSpec.describe "Home", type: :request do
  describe "GET /" do
    it "returns http 302 and redirect" do
      get "/"
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

end
