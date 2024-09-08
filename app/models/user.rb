# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  acts_as_taggable_on :tags

  class ActsAsTaggableOn::Tagging
    def self.ransackable_attributes(_auth_object = nil)
      %w[context created_at id id_value tag_id taggable_id taggable_type tagger_id tagger_type
         tenant]
    end
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at email encrypted_password id id_value name remember_created_at
       reset_password_sent_at reset_password_token updated_at]
  end

  def self.connect_facebook(auth)
    where(email: auth.info.email).first_or_initialize.tap do |user|
      user.facebook_uid = auth.uid
      user.facebook_token = auth.credentials.token
      user.save!
    end
  end
end
