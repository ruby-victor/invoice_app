class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
	t.integer :invoice_id
	t.integer :serial_number
	t.integer :unit
	t.string :description
	t.float :amount
      t.timestamps
    end
  end
end
