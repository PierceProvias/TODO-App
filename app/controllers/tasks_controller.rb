class TasksController < ApplicationController
  
  before_action :set_task, only: %i[ show edit update destroy ]

  
  def index 
    @tasks = Task.where(user: Current.user).order(created_at: :desc)
  end

  def show

  end

  def new
    @task = Task.new
  end

  def edit
    render :edit
  end

  def update
    if @task.update(task_params)
      redirect_to @task
    else
      render :edit
    end
  end

  def create
    @task = Task.new(task_params)
    @task.user = Current.user 
    
    if @task.user
      respond_to do |format|
        if @task.save
          format.html { redirect_to tasks_path, notice: "Task was successfully created." }
          format.json { render :show, status: :created, location: @task }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_path, alert: "Need to be logged in to create a task" 
    end
      
  end

  def destroy
    @task.destroy!

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully completed" }
      format.json { head :no_content }
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :body, :due_date, :due_time, :completed_task)
  end


end