class Reason < ApplicationRecord
  acts_as_list
  belongs_to :storefront

  validates :code, presence: true, uniqueness: { scope: :storefront_id }
  validates :label, presence: true

  scope :ordered, -> { order(ordering: :asc) }
  private

  def assign_position
    last_position = Reason.maximum(:position) || 0
    self.position = last_position + 1
  end
end