class Sample < ActiveRecord::Base
  has_attached_file :screenshot, :styles => {:large => "500x500>", :medium => "300x300>", :thumb => "100x100>" }
  attr_accessible :description, :name, :screenshot, :demo, :category_id

  belongs_to :category
  has_many :comments, :as => :commentable
end
