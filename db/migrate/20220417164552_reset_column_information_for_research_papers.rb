class ResetColumnInformationForResearchPapers < ActiveRecord::Migration[7.0]
  ResearchPaper.reset_column_information
end
