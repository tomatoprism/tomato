class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  after_create:create_cart
  after_create:create_post

         has_many :reviews, dependent: :destroy

         has_many :posts
		 has_many :prefectures, through: :post

         has_many :carts


   acts_as_paranoid
          validates_presence_of   :name
		  validates_presence_of   :email
		  #validates_uniqueness_of :email, allow_blank: true, if: :email_changed?
		 # validates_format_of     :email, with: email_regexp
		  validates_presence_of     :encrypted_password
		  validates_confirmation_of :encrypted_password
		  validates :encrypted_password, length: { minimum: 6, maximum: 128 }

	validates :email, uniqueness_without_deleted: true, allow_blank: true, if: :email_changed?
	has_many :favorites, dependent: :destroy

private
    def create_cart
		carts.create(user_id: self.id)
	end

    def create_post
	    posts.create(user_id: self.id, post_address: self.address, post_code: self.post_code)
    end
end
