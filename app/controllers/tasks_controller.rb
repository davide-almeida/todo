class TasksController < ApplicationController
  before_action :set_task, only: %i[update destroy]

  def index
    tasks
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash.now[:notice] = t('task.create.success')

      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to tasks_path }
      end
    else
      flash.now[:alert] = t('task.create.error')
      tasks

      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.update("flash_messages", partial: "layouts/flash_message") }
        format.html { render :index, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @task.update(task_params)
      flash.now[:notice] = t('task.update.success')
      tasks

      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to tasks_path }
      end
    else
      flash.now[:alert] = t('task.update.error')
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    flash.now[:notice] = t('task.destroy.success')
    tasks

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to tasks_path }
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def tasks
    @tasks = Task.all.order(created_at: :desc)
  end

  def task_params
    params.require(:task).permit(:title, :completed)
  end
end
