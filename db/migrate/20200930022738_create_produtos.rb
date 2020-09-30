class CreateProdutos < ActiveRecord::Migration[6.0]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.decimal :preco
      t.references :categoria, null: false, foreign_key: true

      t.timestamps
    end
  end
end
