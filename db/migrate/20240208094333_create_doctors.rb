class CreateDoctors < ActiveRecord::Migration[7.1]
  def change
    create_table :doctors do |t|
      t.string :name      
      t.string :Specialty
      t.string :zip_code
      t.belongs_to :patient, index: true
      t.belongs_to :city, index: true
      t.timestamps
    end
  end
end
