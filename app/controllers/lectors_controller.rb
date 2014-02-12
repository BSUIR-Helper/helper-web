class LectorsController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:index, :show]

  before_action :load_lector, only: [:show, :edit, :update, :destroy]
  before_action :build_lector, only: [:new, :create]

  # GET /lectors
  def index
    @lectors = policy_scope(Lector)
  end

  # GET /lectors/1
  def show
  end

  # GET /lectors/new
  def new
  end

  # GET /lectors/1/edit
  def edit
  end

  # POST /lectors
  def create
    @lector.attributes = lector_params
    @lector.save
    respond_with @lector
  end

  # PATCH/PUT /lectors/1
  def update
    @lector.update(lector_params)
    respond_with @lector
  end

  # DELETE /lectors/1
  def destroy
    @lector.destroy
    respond_with @lector
  end

  private

    def build_lector
      @lector = Lector.new
      authorize @lector
    end

    def load_lector
      @lector = Lector.find(params[:id])
      authorize @lector
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lector_params
      params.require(:lector).permit(:name, :title, :description)
    end
end
