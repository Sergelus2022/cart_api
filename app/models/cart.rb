class Cart < ApplicationRecord
    validates :comment, presence: true
    validates :api_key, presence: true

    has_many line_items
end
