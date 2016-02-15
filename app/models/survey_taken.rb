class SurveyTaken < ActiveRecord::Base
  # Remember to create a migration!
  self.table_name = "surveys_taken"
  belongs_to :user
  belongs_to :survey
end
