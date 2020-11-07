class TestResult < ApplicationRecord
  belongs_to :home_test_kit

  enum gender: [:male, :female, :other]
  enum test_result: [:positive, :negative, :inconclusive]

  validates :age, numericality: {greater_than: 0}

  validates :email, :full_name, :gender, :address, :post_code, :test_result, :home_test_kit_id, presence: true

end
