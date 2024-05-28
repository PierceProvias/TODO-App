class TasksController < ApplicationController
  
  
  def index
    @tasks = Task.all.order(created_at: :desc)
  end

  def show

  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    @task.user = Current.user   # error here 

    respond_to do |format|
      if @post.save
        format.html { redirect_to task_url(@task), notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy!

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :body, :due_date, :due_time, :completed_task)
  end
end