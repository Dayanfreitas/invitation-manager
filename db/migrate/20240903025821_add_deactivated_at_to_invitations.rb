class AddDeactivatedAtToInvitations < ActiveRecord::Migration[7.0]
  def change
    add_column :invitations, :inactivated_at, :datetime
  end
end
