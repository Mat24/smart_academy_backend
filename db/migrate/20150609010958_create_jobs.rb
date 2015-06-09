class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.belongs_to :owner, index: true
      t.belongs_to :assigned, index: true
      t.text :description
      t.timestamps null: false
    end
  end
  def self.down
    drop_table :jobs
  end
end
