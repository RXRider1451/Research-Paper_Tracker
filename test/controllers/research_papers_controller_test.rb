require "test_helper"

class ResearchPapersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @research_paper = research_papers(:one)
  end

  test "should get index" do
    get research_papers_url
    assert_response :success
  end

  test "should get new" do
    get new_research_paper_url
    assert_response :success
  end

  test "should create research_paper" do
    assert_difference("ResearchPaper.count") do
      post research_papers_url, params: { research_paper: { authors: @research_paper.authors, cross_references: @research_paper.cross_references, link: @research_paper.link, paper_name: @research_paper.paper_name, style_or_type: @research_paper.style_or_type, summary: @research_paper.summary } }
    end

    assert_redirected_to research_paper_url(ResearchPaper.last)
  end

  test "should show research_paper" do
    get research_paper_url(@research_paper)
    assert_response :success
  end

  test "should get edit" do
    get edit_research_paper_url(@research_paper)
    assert_response :success
  end

  test "should update research_paper" do
    patch research_paper_url(@research_paper), params: { research_paper: { authors: @research_paper.authors, cross_references: @research_paper.cross_references, link: @research_paper.link, paper_name: @research_paper.paper_name, style_or_type: @research_paper.style_or_type, summary: @research_paper.summary } }
    assert_redirected_to research_paper_url(@research_paper)
  end

  test "should destroy research_paper" do
    assert_difference("ResearchPaper.count", -1) do
      delete research_paper_url(@research_paper)
    end

    assert_redirected_to research_papers_url
  end
end
