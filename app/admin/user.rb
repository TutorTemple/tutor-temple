# frozen_string_literal: true

ActiveAdmin.register User do
  form do |f|
    f.inputs 'User Details' do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role
    end
    f.actions
  end

  create_or_edit = proc do
    @user = User.where(id: params[:id]).first_or_create
    @user.update_attributes(permitted_params[:user])
    if @user.save
      redirect_to action: :show, id: @user.id
    else
      render @user.new_record? ? :new : :edit
    end
  end
  member_action :create, method: :post, &create_or_edit
  member_action :update, method: :put, &create_or_edit

  permit_params :email, :password, :password_confirmation, :role
end
