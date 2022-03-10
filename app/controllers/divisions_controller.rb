class DivisionsController < ApplicationController
  before_action :set_division, only: %i[ show edit update destroy ]

  # GET /divisions or /divisions.json
  def index
    @divisions = Division.all
    @division_attributes = Division.attribute_names - ["created_at", "updated_at"]
  end

  # GET /divisions/1 or /divisions/1.json
  def show
  end

  # GET /divisions/new
  def new
    @division = Division.new
  end

  # GET /divisions/1/edit
  def edit
  end

  # POST /divisions or /divisions.json
  def create
    puts division_params
    @division = Division.new(division_params.except(:teams))

    respond_to do |format|
      if @division.save
        for team in division_params[:teams]
          Team.find(team).update(division_id: @division.id)
        end
        format.html { redirect_to divisions_url, notice: "Division was successfully created." }
        format.json { render :show, status: :created, location: @division }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @division.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /divisions/1 or /divisions/1.json
  def update
    respond_to do |format|
      if @division.update(division_params.except(:teams))

        current_teams = Team.where(division_id: @division.id).ids || []
        checked_teams = division_params[:teams]&.map(&:to_i) || []
        new_teams = checked_teams - current_teams
        removed_teams = current_teams - checked_teams

        if new_teams.size > 0
          # update new teams
          for team in new_teams
            Team.find(team).update(division_id: @division.id)
          end
        end

        if removed_teams.size > 0
          # update removed teams to nil
          for team in removed_teams
            Team.find(team).update(division_id: nil)
          end
        end


        format.html { redirect_to divisions_url, notice: "Division was successfully updated." }
        format.json { render :show, status: :ok, location: @division }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @division.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /divisions/1 or /divisions/1.json
  def destroy
    @division.destroy

    respond_to do |format|
      format.html { redirect_to divisions_url, notice: "Division was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_division
      @division = Division.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def division_params
      params.require(:division).permit(:name, :description, :manager_id, teams: [])
    end
end
