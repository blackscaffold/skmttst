class CreateApiSamples < ActiveRecord::Migration[5.0]
  def change
    create_table :api_samples do |t|
      t.string :uri
      t.string :body

      t.timestamps
    end
  end
end
