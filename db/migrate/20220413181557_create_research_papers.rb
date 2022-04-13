class CreateResearchPapers < ActiveRecord::Migration[7.0]
  def change
    create_table :research_papers do |t|
      t.string :paper_name
      t.string :link
      t.string :authors
      t.string :style_or_type
      t.text :cross_references
      t.text :summary

      t.timestamps
    end
  end
end
