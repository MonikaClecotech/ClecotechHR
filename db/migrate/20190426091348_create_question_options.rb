class CreateQuestionOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :question_options do |t|
      t.string :answer
      t.integer :user_id
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
