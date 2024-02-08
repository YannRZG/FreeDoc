class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.belongs_to :doctor, index: true
      t.belongs_to :patient, index: true
      t.belongs_to :city, index: true
      t.string :appointment_date
      t.timestamps
    end
  end
end
