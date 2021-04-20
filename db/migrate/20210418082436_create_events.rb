class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string 		:name
      t.text 		:detail
      t.datetime 	:start
      t.float		:ticket_fee

      t.timestamps
    end
  end
end
