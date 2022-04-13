class PriorityListsController < ApplicationController
  before_action :set_priority_list, only: %i[ show edit update destroy ]

  # GET /priority_lists or /priority_lists.json
  def index
    @priority_lists = PriorityList.all
  end

  # GET /priority_lists/1 or /priority_lists/1.json
  def show
  end

  # GET /priority_lists/new
  def new
    @priority_list = PriorityList.new
  end

  # GET /priority_lists/1/edit
  def edit
  end

  # POST /priority_lists or /priority_lists.json
  def create
    @priority_list = PriorityList.new(priority_list_params)

    respond_to do |format|
      if @priority_list.save
        format.html { redirect_to priority_list_url(@priority_list), notice: "Priority list was successfully created." }
        format.json { render :show, status: :created, location: @priority_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @priority_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /priority_lists/1 or /priority_lists/1.json
  def update
    respond_to do |format|
      if @priority_list.update(priority_list_params)
        format.html { redirect_to priority_list_url(@priority_list), notice: "Priority list was successfully updated." }
        format.json { render :show, status: :ok, location: @priority_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @priority_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /priority_lists/1 or /priority_lists/1.json
  def destroy
    @priority_list.destroy

    respond_to do |format|
      format.html { redirect_to priority_lists_url, notice: "Priority list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_priority_list
      @priority_list = PriorityList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def priority_list_params
      params.require(:priority_list).permit(:priority_list)
    end
end
