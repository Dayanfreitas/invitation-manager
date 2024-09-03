class AddTokenToInvitations < ActiveRecord::Migration[7.0]
  def change
    add_column :invitations, :token, :string
    add_index :invitations, :token, unique: true
  end
end
