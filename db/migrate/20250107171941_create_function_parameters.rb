class CreateFunctionParameters < ActiveRecord::Migration[8.0]
  def change
    create_table :function_parameters do |t|
      t.references :appchat_function, null: false, foreign_key: true
      t.string :name
      t.string :example_value

      t.timestamps
    end
  end
end
