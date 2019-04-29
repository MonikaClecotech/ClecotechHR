class Question < ApplicationRecord
  has_many :question_options, dependent: :destroy
  belongs_to :survey
end
