class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :card_number
      t.string :name
      t.string :account_BYN
      t.integer :user_id

      t.timestamps
    end
  end
end
