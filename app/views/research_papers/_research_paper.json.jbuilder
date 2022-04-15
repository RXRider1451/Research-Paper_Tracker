json.extract! research_paper, :id, :paper_name, :link, :authors, :style_or_type, :cross_references, :purpose, :created_at, :updated_at, :dataset, :method, :results
json.url research_paper_url(research_paper, format: :json)
