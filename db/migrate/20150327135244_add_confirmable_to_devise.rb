class AddConfirmableToDevise < ActiveRecord::Migration
  def up
    add_column :logins, :confirmation_token, :string
    add_column :logins, :confirmed_at, :datetime
    add_column :logins, :confirmation_sent_at, :datetime
    add_index :logins, :confirmation_token, unique: true
    
    execute("UPDATE logins SET confirmed_at = NOW()")
    # All existing user accounts should be able to log in after this.
  end

  def down
    remove_columns :logins, :confirmation_token, :confirmed_at, :confirmation_sent_at
    # remove_columns :users, :unconfirmed_email # Only if using reconfirmable
  end
end
