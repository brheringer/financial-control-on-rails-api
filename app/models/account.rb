class Account < ApplicationRecord
    validates :name, presence: true, length: {minimum: 1, maximum: 255}
    validates :structure, presence: true, length: {minimum: 1, maximum: 64},
        format: { with: /[0-9]+(\.[0-9])*/, 
        message: "only allows numbers and dots" }
end
