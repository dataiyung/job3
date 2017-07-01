class AddMoreDetailToJob < ActiveRecord::Migration[5.0]
  def change
  add_column :jobs, :age_upper_limit, :integer
  add_column :jobs, :age_lower_limit, :integer
  add_column :jobs, :contact_email, :string
  end
end
