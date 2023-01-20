class Cart < ApplicationRecord
    validates :api_key, presence: true

    has_many :sellitems, dependent: :destroy
end
