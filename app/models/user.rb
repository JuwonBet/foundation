class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :bank

  has_one :package, through: :user_packages
  has_one :user_package

  has_many :matches
  has_many :matched_users, through: :matches
  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"
  has_many :received_messages, class_name: "Message", foreign_key: "receiver_id"
  scope :ordered, -> { order('created_at desc') }

  enum status: [:activated, :deactivated]

  before_save :set_user_status, if: :new_record?
  before_update :control_user_status

  def set_user_status
  	self.status ||= :deactivated
  end

  def set_user_status_to_activated
    self.status = :activated
  end

  def has_existing_up_link?
    Match.exists?(user_id: self.id)
  end



  private
  def control_user_status
    if self.match_count > 1
      self.status= :deactivated
    end
  end

end
