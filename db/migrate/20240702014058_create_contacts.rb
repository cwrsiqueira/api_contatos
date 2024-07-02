class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :cpf
      t.string :telephone
      t.string :address
      t.string :cep
      t.string :pos

      t.timestamps
    end
  end
end
