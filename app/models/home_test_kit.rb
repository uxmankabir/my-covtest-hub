class HomeTestKit < ApplicationRecord

  validates :ttn_code, presence: true, uniqueness: true

end
