class LectorsController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:index, :show]

  before_action :set_lector, only: [:show, :edit, :update, :destroy]

  # GET /lectors
  # GET /lectors.json
  def index
    @lectors = policy_scope(Lector)
  end

  # GET /lectors/1
  # GET /lectors/1.json
  def show
  end

  # GET /lectors/new
  def new
    @lector = Lector.new
    authorize @lector
  end

  # GET /lectors/1/edit
  def edit
  end

  # POST /lectors
  # POST /lectors.json
  def create
    @lector = Lector.new(lector_params)
    authorize @lector

    respond_to do |format|
      if @lector.save
        format.html { redirect_to @lector, notice: 'Lector was successfully created.' }
        format.json { render action: 'show', status: :created, location: @lector }
      else
        format.html { render action: 'new' }
        format.json { render json: @lector.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lectors/1
  # PATCH/PUT /lectors/1.json
  def update
    respond_to do |format|
      if @lector.update(lector_params)
        format.html { redirect_to @lector, notice: 'Lector was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @lector.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lectors/1
  # DELETE /lectors/1.json
  def destroy
    @lector.destroy
    respond_to do |format|
      format.html { redirect_to lectors_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lector
      @lector = Lector.find(params[:id])
      authorize @lector
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lector_params
      params.require(:lector).permit(:name, :title, :description)
    end
end
