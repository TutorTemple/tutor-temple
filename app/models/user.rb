class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_one :profile, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: { student: 0, tutor: 1, admin: 2 }.freeze

  accepts_nested_attributes_for :profile

  delegate :first_name, :last_name, :gender, :birthday, :avatar, to: :profile

  validates_presence_of :role
  validates_acceptance_of :terms
  attr_accessor :terms
end
