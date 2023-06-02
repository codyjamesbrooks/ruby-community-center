require "rails_helper"

RSpec.describe Admin::UsersController, type: :request do
  let!(:superadmin) { create(:user, :superadmin) }
  let!(:user) { create(:user) }

  describe "with an authorized user" do
    before do
      sign_in superadmin
    end

    describe "GET #index" do
      it "has a sucessful response" do
        get admin_users_path
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:index)
      end
    end

    describe "GET #edit" do
      it "has a sucessful response" do
        get edit_admin_user_path(user)
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:edit)
      end
    end

    describe "GET #show" do
      it "has a sucessful response" do
        get admin_user_path(user)
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:show)
      end
    end

    describe "PATCH #show" do
      context "with valid params" do
        it "finds and updates the user" do
          patch admin_user_path(user), params: {
            user: { email: "new_user_email@example.com", superadmin: "0" },
            id: user.id
          }
          expect(response).to have_http_status(:found)
          expect(response).to redirect_to admin_user_path(user)
          expect(user.reload.email).to eq("new_user_email@example.com")
        end
      end

      context "with invalid params" do
        it "leaves the user unchanged" do
          patch admin_user_path(user), params: {
            id: user.id,
            user: { password: "newPassword", password_confimation: "newPassword" }
          }
          expect(response).to have_http_status(:found)
          expect(response).to redirect_to admin_user_path(user)
          expect(user.reload.password).not_to eq("newPassword")
        end
      end
    end

    describe "DELETE #destroy" do
      it "deletes the user and redirects to user index" do
        delete admin_user_path(user)
        expect(response).to have_http_status(:found)
        expect(User.all.count).to eq(1)
      end
    end
  end

  describe "with an unauthorized user" do
    before do
      sign_in user
    end

    describe "GET #index" do
      it "redirects to application root" do
        get admin_users_path
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to root_path
      end
    end

    describe "GET #edit" do
      it "redirects to application root" do
        get edit_admin_user_path(user)
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to root_path
      end
    end

    describe "GET #show" do
      it "redirects to application root" do
        get admin_user_path(user)
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to root_path
      end
    end

    describe "PATCH #show" do
      context "with valid params" do
        it "leaves user unchanged and redirects to application root" do
          patch admin_user_path(user), params: {
            user: { email: "new_user_email@example.com", superadmin: "0" },
            id: user.id
          }
          expect(response).to have_http_status(:redirect)
          expect(response).to redirect_to root_path
          expect(user.reload.email).not_to eq("new_user_email@example.com")
        end
      end

      context "with invalid params" do
        it "leaves user unchanged and redirects to application root" do
          patch admin_user_path(user), params: {
            user: { password: "newPassword", password_confimation: "newPassword" },
            id: user.id
          }
          expect(response).to have_http_status(:redirect)
          expect(response).to redirect_to root_path
          expect(user.reload.password).not_to eq("newPassword")
        end
      end
    end

    describe "DELETE #destroy" do
      it "doesn't delete user and redirects to root path" do
        delete admin_user_path(user)
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to root_path
        expect(User.all.count).to eq(2)
      end
    end
  end
end
