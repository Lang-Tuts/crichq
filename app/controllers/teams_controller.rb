class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
    @teams = Team.all
  end

  def show
    if params[:bowling_type]
      @switch = 1
      @team_players = Player.where(bowling_type: params[:bowling_type])
    elsif params[:batting_type]
      @switch = 2
      @team_players = Player.where(batting_type: params[:batting_type])
    elsif params[:bowling_hand]
      @switch = 3
      @team_players = Player.where(bowling_hand: params[:bowling_hand])
    elsif params[:keeper]
      if params[:keeper] == "true"
        @switch = 4
      else
        @switch = 5
      end
      @team_players = Player.where(keeper: params[:keeper])
    elsif params[:batting_hand]
      @switch = 6
      @team_players = Player.where(batting_hand: params[:batting_hand])
    else
      @switch = 7
      @team_players = Player.where('lower(teams) like ?',"%#{@team.name.downcase}%")
    end

  end

  def get_player
  end

  def new
    @team = Team.new
  end

  def edit
  end

  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:name)
    end
end
