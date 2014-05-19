class LineItem < ActiveRecord::Base
   attr_accessible :invoice_id, :serial_number ,:unit, :description, :amount
   
   belongs_to :invoice, :dependent => :destroy
   validates :serial_number, :presence => {:message=> "Line Item - serial number is required"}
   validates :unit, :presence => {:message=> "Line Item - unit is required"}
   validates :unit, :numericality => {:message=> "Line Item - unit must be number"}
   validates :description, :presence => {:message=> "Line Item - description is required"}
   validates :amount, :presence => {:message=> "Line Item - amount is required"}
   validates :amount, :numericality => {:message=> "Line Item - amount must be number"}
end
