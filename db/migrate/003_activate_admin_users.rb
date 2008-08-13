class ActivateAdminUsers < ActiveRecord::Migration
  def self.up
    ii = User.find(:all, :conditions => {:admin => true}).collect(&:id)
    User.update_all({:state => 'active'}, {:id => ii})
  end

  def self.down
  end
end
