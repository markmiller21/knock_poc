class AddCollegeColumnAndRenameSchoolToHighSchool < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :college, :string
    rename_column :users, :school, :highschool
  end
end
