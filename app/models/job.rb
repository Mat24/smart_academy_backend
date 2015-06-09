class Job < ActiveRecord::Base
  belongs_to :owner,class_name: "User", foreign_key: :owner_id
  belongs_to :assigned,class_name: "User" , foreign_key: :assigned_id
end
# as_many :jobs, class_name: "Job", foreign_key: :owner_id
