class AddEmployeeToAttendances < ActiveRecord::Migration[7.0]
  def change
    add_reference :attendances, :emp, foreign_key: true
  end
end
