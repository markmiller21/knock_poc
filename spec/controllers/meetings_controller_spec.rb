require 'rails_helper'

RSpec.describe MeetingsController, type: :controller do
  describe "GET #index" do
    login_user

    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(User.all.size).to eq('nimabi@gmail.com')
    end
  end
end
