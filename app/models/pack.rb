class Pack < ActiveRecord::Base
  validates_presence_of :name

  def set_delete
    self.is_deleted = true
    save
  end

  def reset_delete
    self.is_deleted = false
    save
  end

end
