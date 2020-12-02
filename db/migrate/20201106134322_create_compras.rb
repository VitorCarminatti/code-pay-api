class CreateCompras < ActiveRecord::Migration[6.0]
  def change
    create_table :compras do |t|
      t.references :user, null: false, foreign_key: true
      t.references :produto, null: false, foreign_key: true
    end
  end
end
