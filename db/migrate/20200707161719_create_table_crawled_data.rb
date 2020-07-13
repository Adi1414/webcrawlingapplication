class CreateTableCrawledData < ActiveRecord::Migration[6.0]
  def change
    create_table :crawled_data do |t|
      t.string :email
      t.string :phone_number
      t.string :site_name
      t.string :url
      t.timestamps
    end
  end
end
