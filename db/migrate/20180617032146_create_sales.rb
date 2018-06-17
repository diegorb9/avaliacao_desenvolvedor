# frozen_string_literal: true

class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :customer
      t.string :description
      t.decimal :unit_value, default: 0.0
      t.integer :quantity, default: 0
      t.decimal :total, default: 0.0
      t.string :address
      t.string :provider

      t.timestamps null: false
    end
  end
end
