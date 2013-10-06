class Shoppe::DeliveryServicePrice < ActiveRecord::Base

  # Set the table name
  self.table_name = 'shoppe_delivery_service_prices'
  
  # Relationships
  belongs_to :delivery_service, :class_name => 'Shoppe::DeliveryService'
  
  # Validations
  validates :price, :numericality => true
  validates :tax_rate, :numericality => true
  validates :min_weight, :numericality => true
  validates :max_weight, :numericality => true
  
  # Scopes
  scope :ordered, -> { order('price asc')}
  scope :for_weight, -> weight { where("min_weight <= ? AND max_weight >= ?", weight, weight) }
  
end
