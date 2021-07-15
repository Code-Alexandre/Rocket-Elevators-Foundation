class InterventionsController < ApplicationController
  before_action :set_intervention, only: %i[ show edit update destroy ]
  before_action :check_access
  # GET /interventions or /interventions.json
  def index
    @interventions = Intervention.all
  end
  def check_access
    if current_user
      if current_user.employee|| current_user.is_admin
      else
        respond_to do |format|
          format.html { redirect_to root_path, notice: "You need to be sign in as an Employee to create an Intervention!" }
        end
      end    
    else
      respond_to do |format|
        format.html { redirect_to (root_path + 'users/sign_in'), notice: "ign in as an Employee !" }
      end
    end        
  end

  # GET /interventions/show
  def show
  end
  # GET /interventions/create
  def create

    @intervention = Intervention.new(intervention_params)

    if current_user.employee

      @intervention.author_id = Employee.where(user_id: current_user.id)[0].id
      
    else

      @intervention.author_id = 0
      
    end 
    @intervention.result = 'Incomplete'
    @intervention.status = 'Pending'
    @intervention.start_date = 'null'
    @intervention.end_date = 'null'
    # @intervention.valid?




    respond_to do |format| 
      if @intervention.save
        format.html { redirect_to (rails_admin_path + "/intervention/#{@intervention.id}"), notice: "Intervention was successfully created." }
      else
        for msg in @intervention.errors.full_messages do
          if msg == "Author must exist"
            msg = "You must be log in has an Employee to register an Intervention."
          end
          flash[:notice] = "#{msg}"  
        end
        format.html {render :new}
      end
    end
  end 
  # GET /interventions/new
  def new
    @intervention = Intervention.new
  end

  # GET /interventions/edit
  def edit
  end
  # GET /interventions/update
  def update
    respond_to do |format|
      if @intervention.update(intervention_params)
        format.html { redirect_to @intervention, notice: "Intervention was successfully updated." }
        format.json { render :show, status: :ok, location: @intervention }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end
  # GET /interventions/destroy
  def destroy
    @intervention.destroy
    respond_to do |format|
      format.html { redirect_to interventions_url, notice: "Intervention was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  # GET /interventions/buildings_for_customer
  def buildings_for_customer
    @buildings = Building.where("customer_id = ?", params[:customer_id])
    respond_to do |format|
    format.json { render :json => @buildings }
    end
  end
  # GET /interventions/batteries_for_building
  def batteries_for_building
    @batteries = Battery.where("building_id = ?", params[:building_id])
    respond_to do |format|
    format.json { render :json => @batteries }
    end
  end
  # GET /interventions/columns_for_battery
  def columns_for_battery
    @columns = Column.where("battery_id = ?", params[:battery_id])
    respond_to do |format|
    format.json { render :json => @columns }
    end
  end
  # GET /interventions/elevators_for_column
  def elevators_for_column
    @elevators = Elevator.where("column_id = ?", params[:column_id])
    respond_to do |format|
    format.json { render :json => @elevators }
    end
  end

  private
      # Use callbacks to share common setup or constraints between actions.
    def set_intervention
      @intervention = Intervention.find(params[:id])
    end
  
      # Only allow a list of trusted parameters through.
    # Only allow a list of trusted parameters through.
  def intervention_params
    params.require(:intervention).permit(:author_id, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :start_date, :end_date, :result, :report, :status)
  end
end
