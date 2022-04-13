require "application_system_test_case"

class ResearchPapersTest < ApplicationSystemTestCase
  setup do
    @research_paper = research_papers(:one)
  end

  test "visiting the index" do
    visit research_papers_url
    assert_selector "h1", text: "Research papers"
  end

  test "should create research paper" do
    visit research_papers_url
    click_on "New research paper"

    fill_in "Authors", with: @research_paper.authors
    fill_in "Cross references", with: @research_paper.cross_references
    fill_in "Link", with: @research_paper.link
    fill_in "Paper name", with: @research_paper.paper_name
    fill_in "Style or type", with: @research_paper.style_or_type
    fill_in "Summary", with: @research_paper.summary
    click_on "Create Research paper"

    assert_text "Research paper was successfully created"
    click_on "Back"
  end

  test "should update Research paper" do
    visit research_paper_url(@research_paper)
    click_on "Edit this research paper", match: :first

    fill_in "Authors", with: @research_paper.authors
    fill_in "Cross references", with: @research_paper.cross_references
    fill_in "Link", with: @research_paper.link
    fill_in "Paper name", with: @research_paper.paper_name
    fill_in "Style or type", with: @research_paper.style_or_type
    fill_in "Summary", with: @research_paper.summary
    click_on "Update Research paper"

    assert_text "Research paper was successfully updated"
    click_on "Back"
  end

  test "should destroy Research paper" do
    visit research_paper_url(@research_paper)
    click_on "Destroy this research paper", match: :first

    assert_text "Research paper was successfully destroyed"
  end
end
