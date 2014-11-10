class ParliamentsController < ApplicationController
  before_action :set_parliament, only: [:show, :edit, :update]
  before_action :check_user_has_access, only: [:show, :edit]

  # GET /parliaments
  # GET /parliaments.json
  def index
    @parliament = Parliament.new
  end

  # GET /parliaments/1
  # GET /parliaments/1.json
  def show
  end

  # GET /parliaments/1/edit
  def edit
  end

  # POST /parliaments
  # POST /parliaments.json
  def create
    @parliament = Parliament.new(parliament_params)
    binding.pry
    respond_to do |format|
      if @parliament.save
        session[:id] = @parliament.id
        format.html { redirect_to @parliament, notice: 'Din søknad er nå sendt.' }
        format.json { render action: 'show', status: :created, location: @parliament }
      else
        format.html { render action: 'new' }
        format.json { render json: @parliament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parliaments/1
  # PATCH/PUT /parliaments/1.json
  def update
    respond_to do |format|
      if @parliament.update(parliament_params)
        format.html { redirect_to @parliament, notice: 'Din søknad ble oppdatert.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @parliament.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parliament
      @parliament = Parliament.find_by_id(params[:id])
    end

    def check_user_has_access
      redirect_to root_path if @parliament.id != session[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parliament_params
      params.require(:parliament).permit(:name, :email, :years_work_lost, :place_of_study, :remember_date, :why_attend, :created_at, :updated_at, :why_ip_relevant, :what_study, :how_hear_about_day, :how_corrupt, :had_cimilar_experience, :how_corrupt_tgi)
    end
end
