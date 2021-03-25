class Person < ApplicationRecord 
    validates :name, :house, presence: true 

    belongs_to :house,
        primary_key: :id,
        foriegn_key: :house_id,
        class_name: :House 
end