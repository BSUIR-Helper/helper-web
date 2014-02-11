class DisciplinesController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:index, :show]

  before_action :load_discipline, only: [:show, :edit, :update, :destroy]

  # GET /disciplines
  def index
    @disciplines = policy_scope(Discipline)
  end

  # GET /disciplines/1
  def show
  end

  # GET /disciplines/new
  def new
    @discipline = Discipline.new
    authorize @discipline
  end

  # GET /disciplines/1/edit
  def edit
  end

  # POST /disciplines
  def create
    @discipline = Discipline.new(discipline_params)
    authorize @discipline
    @discipline.save
    respond_with @discipline
  end

  # PATCH/PUT /disciplines/1
  def update
    @discipline.update(discipline_params)
    respond_with @discipline
  end

  # DELETE /disciplines/1
  def destroy
    @discipline.destroy
    respond_with @discipline
  end

  private

    def load_discipline
      @discipline = Discipline.find(params[:id])
      authorize @discipline
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discipline_params
      params.require(:discipline).permit(:name, :abbr)
    end
end
