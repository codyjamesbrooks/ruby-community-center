ActiveAdmin.register User do
  menu priority: 2
  actions :all, except: [:new, :create]

  filter :email

  permit_params(
    :email,
    :superadmin
  )

  index do
    column :email do |user|
      link_to user.email, admin_user_path(user)
    end
    column "Super Admin?", :superadmin do |user|
      status_tag(user.superadmin?)
    end
    column :created_at
    id_column
  end

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :superadmin
    end
    f.actions
  end
end
