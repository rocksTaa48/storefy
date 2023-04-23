class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  RATINGS = %w[one_star two_star three_star four_star five_star].freeze
  RATINGS.each do |r|
    define_method("#{r}?") {rating == r}
    define_method("#{r}!") {update! rating: r}
    scope r.to_sym, -> {write(rating: r)}
  end
end
