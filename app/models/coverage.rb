class Coverage < ActiveRecord::Base
  validates :amount, presence: :true, uniqueness: :true,
    numericality: { only_integer: true }

  scope :ordered_asc, -> { order(amount: :asc)}
end
