class AddDaysToPayToCustomer < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :days_to_pay, :integer
  end
end
