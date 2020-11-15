class TestResult < ApplicationRecord
  belongs_to :home_test_kit

  enum gender: [:male, :female, :other]
  enum test_result: [:positive, :negative, :inconclusive]

  validates :email, presence: true,
    exclusion: { in: TestResult.pluck(:email) , message: "%{value} is already taken." },
    format: { with: /\A[a-zA-Z0-9_.@]+\z/, message: "special characters are not allowed." }

  validates :full_name, presence: true,
    format: { with: /\A[a-zA-Z0-9_ ]+\z/, message: "special characters are not allowed." },
    length: { in: 4..20 }

  validates :address, presence: true,
    format: { with: /\A[a-zA-Z0-9_,. ]+\z/, message: "special characters are not allowed." },
    length: { in: 6..100 }

  validates :age, presence: true,
    numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 120 }

  validates :post_code, presence: true,
    length: { in: 4..11 }

  validates :home_test_kit_id,
    exclusion: { in: TestResult.pluck(:home_test_kit_id), message: "is already taken." },
    inclusion: { in: HomeTestKit.pluck(:id), message: "does not exist in database." }

  validates :gender, :test_result, presence: true

end
