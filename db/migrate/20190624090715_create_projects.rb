class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.text :techs_stack
      t.string :current_version
      t.string :link

      t.timestamps
    end
  end
end
