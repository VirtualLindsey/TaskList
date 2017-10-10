class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(title: params[:task][:title]) #and so on
    task.save
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def updated
    @task = Task.find(params[:id])
    @task.title = params[:task][:title]
    @task.description = params[:task][:description]
    @task.due_date = params[:task][:due_date]
    @task.complete = params[:task][:complete]
    if @task.complete
      @task.date_completed = DateTime.now
    else
      @task.date_completed = nil
    end
    @task.save
    redirect_to tasks_path
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
      redirect_to tasks_path
  end

  def complete
   task = Task.find(params[:id])
   task.complete = true
   task.date_completed = DateTime.now
   task.save
   redirect_to('/tasks')
 end
end