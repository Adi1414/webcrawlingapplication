class CreateTableCrawledData < ActiveRecord::Migration[6.0]
  def change
    create_table :crawled_data do |t|
      t.references :user, null: false, foreign_key: true
      t.string :email
      t.string :phone_number
      t.timestamps
    end
  end
end
