class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.references :category, null: false, foreign_key: true
      t.string :name
      t.decimal :amount

      t.timestamps
    end
  end
end
