class TasksController < ApplicationController
  def index
  	@task = Task.new
  	@tasks = Task.all
  end

  def create
  	Task.create params[:task]
  	redirect_to :back

  end

  def edit
  	@task = Task.find params[:id]
  end

  def update
  	task = Task.find params[:id]
  	if task.update_attributes params[:task]
  		redirect_to tasks_path, :notice => 'Task updated.'
  	else
  		redirect_to :back, :notice => 'Error updating task.'
  	end
  end

  def destroy
  	Task.destroy params[:id]
  	redirect_to :back, :notice => 'Task has been deleted.'
  end
end
