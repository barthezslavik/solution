class Sample < ActiveRecord::Base
  has_attached_file :screenshot, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  attr_accessible :description, :name, :screenshot
end
