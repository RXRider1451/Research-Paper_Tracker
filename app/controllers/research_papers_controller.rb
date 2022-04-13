class ResearchPapersController < ApplicationController
  before_action :set_research_paper, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token
  # GET /research_papers or /research_papers.json
  def index
    @research_papers = ResearchPaper.all
    @currPriorityList = PriorityList.all.first
    @recentlyAddedPaper = ResearchPaper.all.last
  end

  # GET /research_papers/1 or /research_papers/1.json
  def show
  end

  # GET /research_papers/new
  def new
    @research_paper = ResearchPaper.new
  end

  # GET /research_papers/1/edit
  def edit
  end

  # POST /research_papers or /research_papers.json
  def create
    @research_paper = ResearchPaper.new(research_paper_params)

    respond_to do |format|
      if @research_paper.save
        format.html { redirect_to research_paper_url(@research_paper), notice: "Research paper was successfully created." }
        format.json { render :show, status: :created, location: @research_paper }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @research_paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /research_papers/1 or /research_papers/1.json
  def update
    respond_to do |format|
      if @research_paper.update(research_paper_params)
        format.html { redirect_to research_paper_url(@research_paper), notice: "Research paper was successfully updated." }
        format.json { render :show, status: :ok, location: @research_paper }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @research_paper.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_priority
    #Get all the  parameters from ajax's url
    @newPriorityList = params[:priorityList]
    #Fetch the record from the database by term
    currPriorityList = PriorityList.first
    #Update the model and save
    currPriorityList.priority_list = @newPriorityList
    currPriorityList.save
  end

  # DELETE /research_papers/1 or /research_papers/1.json
  def destroy
    @research_paper.destroy

    respond_to do |format|
      format.html { redirect_to research_papers_url, notice: "Research paper was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_research_paper
      @research_paper = ResearchPaper.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def research_paper_params
      params.require(:research_paper).permit(:paper_name, :link, :authors, :style_or_type, :cross_references, :summary)
    end
end
