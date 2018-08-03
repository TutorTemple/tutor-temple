# frozen_string_literal: true

ActiveAdmin.register Subject do
  remove_filter :profile_subjects

  permit_params :name
end
