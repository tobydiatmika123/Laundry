class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :shoe
  belongs_to :service

  before_validation :set_defaults

  private

  def set_defaults
    self.order_date ||= Time.current
    self.status ||= "Proses"
    self.total_price ||= service&.price || 0
  end
end

