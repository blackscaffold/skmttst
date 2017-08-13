class CreateSamples < ActiveRecord::Migration[5.0]
  def change
    create_table :samples do |t|
      t.string :title
      t.string :data

      t.timestamps
    end
  end
end
