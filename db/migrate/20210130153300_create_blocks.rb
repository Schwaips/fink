class CreateBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :blocks do |t|
      t.references :lecture, null: false, foreign_key: true
      t.string :block_type
      t.text :content

      t.timestamps
    end
  end
end
