class AddUserColumns < ActiveRecord::Migration
  def self.up
    add_column :users, :remember_token, :string
    add_column :users, :remember_token_expires_at, :datetime
    add_column :users, :activation_code, :string, :limit => 40
    add_column :users, :activated_at, :datetime
    add_column :users, :state, :string, :default => 'passive'
    add_column :users, :deleted_at, :datetime
    add_column :users, :site_id, :integer
    add_column :users, :last_login_at, :datetime
    add_column :users, :bio_html, :text
    add_column :users, :openid_url, :string
    add_column :users, :last_seen_at, :datetime
    add_column :users, :website, :string
    add_column :users, :posts_count, :integer, :default => 0
    add_column :users, :bio, :string
    add_column :users, :display_name, :string
    add_column :users, :permalink, :string

    add_index "users", ["last_seen_at"], :name => "index_users_on_last_seen_at"
    add_index "users", ["site_id", "posts_count"], :name => "index_site_users_on_posts_count"
    add_index "users", ["site_id", "permalink"], :name => "index_site_users_on_permalink"
  end
end
