class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
	t.string :name
	t.integer :number
	t.float :amount
	t.timestamps
    end
  end
end
