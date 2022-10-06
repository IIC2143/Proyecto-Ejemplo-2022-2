class Game < ApplicationRecord
    validates :name, :year, :publisher, :genre, presence: true
    validates :year, numericality: { only_integer: true, greater_than: 0}
    has_and_belongs_to_many :users
    has_many :reviews
end
