class DefaultTasksController < ApplicationController
  # GET /default_tasks
  # GET /default_tasks.json
  def index
    @default_tasks = DefaultTask.all

    render json: @default_tasks
  end

  # GET /default_tasks/1
  # GET /default_tasks/1.json
  def show
    @default_task = DefaultTask.find(params[:id])

    render json: @default_task
  end

  # POST /default_tasks
  # POST /default_tasks.json
  def create
    @default_task = DefaultTask.new(params[:default_task])

    if @default_task.save
      render json: @default_task, status: :created, location: @default_task
    else
      render json: @default_task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /default_tasks/1
  # PATCH/PUT /default_tasks/1.json
  def update
    @default_task = DefaultTask.find(params[:id])

    if @default_task.update(params[:default_task])
      head :no_content
    else
      render json: @default_task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /default_tasks/1
  # DELETE /default_tasks/1.json
  def destroy
    @default_task = DefaultTask.find(params[:id])
    @default_task.destroy

    head :no_content
  end
end
