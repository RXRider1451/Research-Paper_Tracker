class ChangeLinkToTextFormat < ActiveRecord::Migration[7.0]
  def change
    change_column :research_papers, :link, :text
  end
end
