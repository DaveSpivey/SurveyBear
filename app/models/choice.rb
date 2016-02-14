class Choice < ActiveRecord::Base
  
  has_one :survey, through: :questions
  belongs_to :question
  has_many :responses
end
