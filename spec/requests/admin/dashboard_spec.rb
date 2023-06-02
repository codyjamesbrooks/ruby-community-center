require "rails_helper"

RSpec.describe Admin::DashboardController, type: :request do
  let!(:superadmin) { create(:user, :superadmin) }
  let!(:user) { create(:user) }

  describe "GET #index" do
    context "with an authorized user" do
      it "has a sucessful response" do
        sign_in superadmin
        get admin_dashboard_path
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:index)
      end
    end

    context "with an unauthorized user" do
      it "redirects to application root" do
        sign_in user
        get admin_dashboard_path
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to root_path
      end
    end
  end
end
