class Project < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, :current_version, presence: true

  scope :recent, -> { order(updated_at: :desc) }
end
