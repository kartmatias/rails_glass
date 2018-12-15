class CreateProdutos < ActiveRecord::Migration[5.2]
  def change
    create_table :produtos do |t|
      t.string :referencia
      t.string :descricao
      t.decimal :preco1, precision: 10, scale: 2

      t.timestamps
    end
  end
end
