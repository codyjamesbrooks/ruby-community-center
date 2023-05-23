require "rails_helper"

RSpec.describe Devise::SessionsController, type: :request do
  let!(:user) { create(:user) }

  describe "GET #new" do
    it "has a sucessful response" do
      get new_user_session_url
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new session" do
        post new_user_session_url, params: {
          user: { email: user.email, password: user.password, remember_me: "0" }
        }
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to root_path
        expect(controller.current_user).to eq(user)
      end
    end

    context "with invalid parameters" do
      it "doesn't create a new session" do
        post new_user_session_url, params: {
          user: { email: user.email, remember_me: "0" }
        }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:new)
        expect(controller.current_user).to be_nil
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys a users session" do
      sign_in user
      get root_url
      expect(controller.current_user).to eq(user)
      delete destroy_user_session_url

      expect(response).to have_http_status(:see_other)
      expect(response).to redirect_to root_path
      expect(controller.current_user).to be_nil
    end
  end
end
