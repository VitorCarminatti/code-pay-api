class AddSaldoToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :saldo, :decimal, default: 0
  end
end
