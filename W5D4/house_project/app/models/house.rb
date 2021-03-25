class House < ApplicationRecord
    validates :address, presence: true

    has_many :residents,
        primary_key: :id,
        foriegn_key: :house_id,
        class_name: :Person 
end