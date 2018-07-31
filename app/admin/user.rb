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

  permit_params :email, :password, :password_confirmation, :role
end
