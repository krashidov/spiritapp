class CareplansController < ApplicationController
  # GET /careplans
  # GET /careplans.json
  def index
    @careplans = Careplan.all

    render json: @careplans
  end

  # GET /careplans/1
  # GET /careplans/1.json
  def show
    @careplan = Careplan.find(params[:id])

    render json: @careplan
  end

  # POST /careplans
  # POST /careplans.json
  def create
    @careplan = Careplan.new(params[:careplan])

    if @careplan.save
      render json: @careplan, status: :created, location: @careplan
    else
      render json: @careplan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /careplans/1
  # PATCH/PUT /careplans/1.json
  def update
    @careplan = Careplan.find(params[:id])

    if @careplan.update(params[:careplan])
      head :no_content
    else
      render json: @careplan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /careplans/1
  # DELETE /careplans/1.json
  def destroy
    @careplan = Careplan.find(params[:id])
    @careplan.destroy

    head :no_content
  end
end
