# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params %i[email password password_confirmation]

  form do |f|
    f.inputs 'User' do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
