class CreateLectors < ActiveRecord::Migration
  def change
    create_table :lectors do |t|
      t.string :name
      t.string :title
      t.text :description

      t.timestamps
    end

    create_table :lector_disciplines do |t|
      t.belongs_to :lector
      t.belongs_to :discipline
      t.timestamps
    end
  end
end
