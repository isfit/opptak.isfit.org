# encoding: utf-8
class PositionsController < ApplicationController
  before_filter :require_signin!, only: [:edit, :update, :lock, :locked]

 def index
    @positions = Position
      .published
      .includes(:groups)
      .includes(:sections)
      .order("sections.name_no, groups.name_no, positions.title_no")
    
    #@positions = Position.published.includes(:groups).order("groups.section_id, groups.id, positions.title_no")
    #@positions = Position.all_ordered_by_section_name_position_name
    @research_group = Group.find(159)
    @communication = Section.find(22)
  end
 
  def show
    @position = Position.find_by_id(params[:id])

    redirect_to positions_path if @position.nil?
    #unless Position.published.all.include?(@position)
    #  redirect_to opptak_path, :notice => "That position does not exist"
    #end
  end

  def edit
   @applicant = Applicant.find(params[:id])
   @positions_collection = positions_collected
  end

  def update
    @applicant = Applicant.find(current_user.applicant.id)
    respond_to do |format|
      if @applicant.update_attributes(user_params)
        format.html { redirect_to show_applicant_user_path, notice: 'Søknad oppdatert.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def section
    @section = Section.find(params[:id])
    if !@section.id.eql?(22)
      redirect_to root_path
    end
    @positions = @section.positions
  end

  def group
    @group = Group.find(params[:id])
    @positions = @group.positions.published
  end

def apply
  @applicant = Applicant.new
  @positions_collected = positions_collected
  @referral_position = params[:referral_position]

  respond_to do |format|
    format.html { render :template => "positions/apply" }
  end
end
  

 def save
    @applicant = Applicant.new(user_params)
    new_user = false

    if current_user
      @applicant.applicant_user_id = current_user.id
    else
      new_user = true
      @applicant_user = ApplicantUser.new({ mail: @applicant.mail })
      @password = @applicant_user.set_password
      if @applicant_user.save
        @applicant.applicant_user_id = @applicant_user.id
      else
        flash[:notice] = "Noe gikk galt. Har du allerede registrert med denne epostadressen? Hvis ikke kontakt orakel@isfit.org på epost."
        @positions_collected = positions_collected
        @referral_position = params[:referral_position]

        #redirect_to action: :apply
        render action: :apply
        return
      end
    end

    respond_to do |format|
      if @applicant.save
        if new_user
          Postoffice.applicant_add_with_new_user(@applicant.full_name, @applicant.mail, @password).deliver
        else
          Postoffice.applicant_add(@applicant.full_name, @applicant.mail).deliver
        end
        flash[:notice] = "Din søknad ble sendt."
        @positions = Position.published

        if current_user.nil?
          session[:user_id] = @applicant_user.id
        end

        format.html { redirect_to show_applicant_user_path }
      else
        flash[:notice] = nil
        @positions = Position.published
        format.html { render :action => :apply }
      end
    end
 end
 def validate
   if params[:field].blank? || params[:value].blank?
     render :nothing => true
   else
     @valid = Applicant.validate_field(params[:field], params[:value])
     render :json => @valid
   end
 end
end

private
def user_params
  params.require(:applicant).permit!
end

def positions_collected
  @positions = Position.published.includes(:groups).order("groups.section_id, groups.id,positions.title_no")
  @positions_collection = []
  @positions.each { |p| @positions_collection << ["#{p.groups.first.name} - #{p.title}", p.id]} 
end