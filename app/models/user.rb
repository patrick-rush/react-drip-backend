class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  has_many :plants
  has_many :care_events, through: :plants
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  def care_events_by_date
    self.care_events.where(completed: false).order(due_date: :asc)
  end

  def todays_care_events
    self.care_events.where(due_date: Date.today)
  end
end

# START HERE NEED TO CONNECT USER AND CARE EVENTS SOMEHOW
# IN THE PROCESS OF ADDING SCOPE METHOD TO CARE_EVENTS