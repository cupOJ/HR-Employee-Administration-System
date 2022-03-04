class TeamsController < ApplicationController
  before_action :set_team, only: %i[ show edit update destroy ]

  # GET /teams or /teams.json
  def index
    @teams = Team.all
    @team_attributes = Team.attribute_names - ["created_at", "updated_at"]
  end

  # GET /teams/1 or /teams/1.json
  def show
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams or /teams.json
  def create
    @team = Team.new(team_params.except(:employees))

    respond_to do |format|
      if @team.save
        for employee in team_params[:employees]
          Employee.find(employee).update(team_id: @team.id)
        end
        format.html { redirect_to teams_url, notice: "Team was successfully created." }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1 or /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params.except(:employees))

        current_employees = Employee.where(team_id: @team.id).ids
        checked_employees = team_params[:employees].map(&:to_i)
        new_employees = checked_employees - current_employees
        removed_employees = current_employees - checked_employees

        if new_employees.size > 0
          # update new employees
          for employee in team_params[:employees]
            Employee.find(employee).update(team_id: @team.id)
          end
        end

        if removed_employees.size > 0
          # update removed employees to nil
          for employee in removed_employees
            Employee.find(employee).update(team_id: nil)
          end
        end

        format.html { redirect_to teams_url, notice: "Team was successfully updated." }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1 or /teams/1.json
  def destroy
    @team.destroy

    respond_to do |format|
      format.html { redirect_to teams_url, notice: "Team was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def team_params
      params.require(:team).permit(:name, :description, :team_lead_id, :division_id, employees: [])
    end
end
