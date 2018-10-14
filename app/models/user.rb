class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

    def self.included(base)
		base.class_eval do
		  validates_presence_of   :email, if: :email_required?
		  #validates_uniqueness_of :email, allow_blank: true, if: :email_changed?
		  validates_format_of     :email, with: email_regexp, allow_blank: true, if: :email_changed?

		  validates_presence_of     :password, if: :password_required?
		  validates_confirmation_of :password, if: :password_required?
		  validates_length_of       :password, within: password_length, allow_blank: true
		end
	end
         has_many :reviews
         has_one :cart

  acts_as_paranoid
  validates :email, uniqueness_without_deleted: true, allow_blank: true, if: :email_changed?


end
