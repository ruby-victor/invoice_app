class Invoice < ActiveRecord::Base
   attr_accessible :name, :number ,:amount,:line_items_attributes
   
   has_many :line_items ,:dependent => :destroy
   accepts_nested_attributes_for :line_items, :reject_if => :all_blank,  :allow_destroy => true
   
   validates  :number, :presence => {:message => "Invoice number required"}
   validates :number, :numericality => { :only_integer => true ,:message=>"Invoice number must be integer"}
   validates :number, :uniqueness => { :message=>"Invoice number already present"}
   validates  :name, :presence => {:message => "Name is required"}
   validates  :amount, :presence => {:message => "Total Amount is required"}
   validates :amount, :numericality => {:message => "Total Amount must be in numbers"}
   
   
   def amount_rounded
	   self.amount.round
   end
   
   def self.next_number
				!last.nil? ? last.number.next : 1
   end
   
end
