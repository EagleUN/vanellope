class CreateFuncionaras < ActiveRecord::Migration[5.2]
  def change
    create_table :funcionaras, id: :uuid do |t|
      t.string :info
      t.string :name

      t.timestamps
    end
  end
end
