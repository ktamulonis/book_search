class CreateAppchatFunctions < ActiveRecord::Migration[8.0]
  def change
    create_table :appchat_functions do |t|
      t.string :name
      t.text :description
      t.string :class_name

      t.timestamps
    end
  end
end
