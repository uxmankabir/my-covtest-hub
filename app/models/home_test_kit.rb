class HomeTestKit < ApplicationRecord
  has_many :test_results

  validates :ttn_code, presence: true, uniqueness: true

end
