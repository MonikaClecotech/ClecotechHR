class Question < ApplicationRecord
  has_many :question_options, dependent: :destroy
end
