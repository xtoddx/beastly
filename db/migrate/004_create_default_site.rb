class CreateDefaultSite < ActiveRecord::Migration

  def self.up
    execute "INSERT INTO sites (name, host) VALUES ('Default', '')"
    User.update_all({:site_id => 1}, {:site_id => nil})
  end

  def self.down
    # do nothing #
  end

end
