class Cart < ApplicationRecord
    validates :api_key, presence: true
    validates_uniqueness_of :api_key
    has_many :sellitems, dependent: :destroy
end
