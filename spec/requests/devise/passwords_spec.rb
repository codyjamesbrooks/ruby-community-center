require "rails_helper"

RSpec.describe Devise::PasswordsController, type: :request do
  let!(:user) { create(:user) }

  describe "GET #new" do
    it "has a successful response" do
      get new_user_password_url
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "redirects to root triggers reset email" do
        post user_password_url, params: {
          user: { email: user.email }
        }
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to new_user_session_path
        expect(controller.current_user).to be_nil
        expect(ActionMailer::Base.deliveries.count).to eq(1)
      end
    end

    context "with invalid parameters" do
      it "redirects to root triggers reset email" do
        post user_password_url, params: {
          user: { email: "" }
        }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:new)
        expect(controller.current_user).to be_nil
        expect(ActionMailer::Base.deliveries.count).to eq(0)
      end
    end
  end
end
