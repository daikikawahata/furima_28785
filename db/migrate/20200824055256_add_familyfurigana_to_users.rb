class AddFamilyfuriganaToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :family_name_furigana, :string
  end
end
