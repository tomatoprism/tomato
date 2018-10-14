class UpdateIndexUserOnEmail < ActiveRecord::Migration[5.2]
  def up
    remove_index :users, :email
    execute 'CREATE UNIQUE INDEX unique_index_on_users_email ON users(email) WHERE deleted_at IS NULL'
  end

  def down
    execute 'DROP INDEX unique_index_on_users_email'
    add_index :users, :email, unique: true
  end
end
