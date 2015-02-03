class Rate < ActiveRecord::Base
  validates :min_age, presence: true, numericality: true, 
    uniqueness: { :scope =>[:max_age, :person_type, :smoking] }
  validates :max_age, presence: true ,numericality: true, 
    uniqueness: { :scope =>[:min_age, :person_type, :smoking] }
  validates :percentage, presence: true, numericality: true
  validates :person_type, presence: true, 
    uniqueness: { :scope =>[:min_age, :max_age, :smoking] }
  validates :smoking, inclusion: { in: [true, false] },
    uniqueness: { :scope =>[:min_age, :max_age, :person_type] }

  scope :employees, -> { where( person_type: 'Employee' )}
  scope :spouses, -> { where( person_type: 'Spouse' )}
  scope :smoking, -> { where( smoking: true )}
  scope :non_smoking, -> { where( smoking: false )}
  scope :ordered_by_age, -> { order(min_age: :asc)}

  def self.all_age_ranges
    Rate.all.select("min_age, max_age").uniq.
      map { |rate| "#{rate.min_age}-#{rate.max_age}" }
  end
end
