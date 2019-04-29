class AddSurveyToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :survey, foreign_key: true
  end
end
