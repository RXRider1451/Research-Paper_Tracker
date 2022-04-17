class AddPublishedYearToResearchPapers < ActiveRecord::Migration[7.0]
  def change
    add_column :research_papers, :published_year, :date
  end
end
