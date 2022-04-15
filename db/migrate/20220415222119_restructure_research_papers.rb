class RestructureResearchPapers < ActiveRecord::Migration[7.0]
  def change
    rename_column :research_papers, :summary, :purpose
    add_column :research_papers, :dataset, :text
    add_column :research_papers, :method, :text
    add_column :research_papers, :results, :text
  end
end
