class ChangePurblishedYearType < ActiveRecord::Migration[7.0]
  def change
    change_column :research_papers, :published_year, :string
  end
end
