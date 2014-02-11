class DisciplinesController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:index, :show]

  before_action :load_discipline, only: [:show, :edit, :update, :destroy]

  # GET /disciplines
  # GET /disciplines.json
  def index
    @disciplines = policy_scope(Discipline)
  end

  # GET /disciplines/1
  # GET /disciplines/1.json
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
  # POST /disciplines.json
  def create
    @discipline = Discipline.new(discipline_params)
    authorize @discipline

    respond_to do |format|
      if @discipline.save
        format.html { redirect_to @discipline, notice: 'Discipline was successfully created.' }
        format.json { render action: 'show', status: :created, location: @discipline }
      else
        format.html { render action: 'new' }
        format.json { render json: @discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disciplines/1
  # PATCH/PUT /disciplines/1.json
  def update
    respond_to do |format|
      if @discipline.update(discipline_params)
        format.html { redirect_to @discipline, notice: 'Discipline was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disciplines/1
  # DELETE /disciplines/1.json
  def destroy
    @discipline.destroy
    respond_to do |format|
      format.html { redirect_to disciplines_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_discipline
      @discipline = Discipline.find(params[:id])
      authorize @discipline
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discipline_params
      params.require(:discipline).permit(:name, :abbr)
    end
end
