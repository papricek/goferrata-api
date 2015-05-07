class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.string :link
      t.string :name
      t.string :state
      t.string :region
      t.string :locality
      t.string :lat
      t.string :lng
      t.string :start
      t.string :target
      t.integer :duration
      t.integer :elevationdiff
      t.integer :height
      t.string :slug
      t.string :difficulty

      t.timestamps
    end
  end
end
