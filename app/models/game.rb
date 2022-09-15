class Game < ApplicationRecord
    validates :name, :year, :publisher, :genre, presence: true
    validates :year, numericality: { only_integer: true, greater_than: 0}
end
