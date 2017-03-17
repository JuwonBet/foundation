class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :bank

  has_many :matches
  has_many :matched_users, through: :matches

  scope :ordered, -> { order('created_at desc') }
  
  enum status: [:activated, :deactivated]

  before_save :set_user_status, if: :new_record?

  def set_user_status
  	self.status ||= :deactivated
  end
end
