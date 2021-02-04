class CreatePatientFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :patient_feedbacks do |t|
      t.string :patient_name
      t.string :patient_email
      t.string :doctor_name
      t.text :feedback

      t.timestamps
    end
  end
end
