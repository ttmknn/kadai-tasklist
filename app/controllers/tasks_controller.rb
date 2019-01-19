class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:success] = 'タスクが正常に登録されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスクが登録されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] = 'タスクは正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスクは更新されませんでした'
      render :edit
    end
  end

  def destroy
<<<<<<< HEAD
    @task.destroy

=======
    @task = Task.find(params[:id])
    @task.destroy
  
>>>>>>> 78386099eac4460015e3ef3d531527a433eb1f72
    flash[:success] = 'タスクは正常に削除されました'
    redirect_to tasks_url
  end

  def set_task
    @task = Task.find(params[:id])
  end

  private

  # Strong Parameter
  def task_params
<<<<<<< HEAD
  params.require(:task).permit(:content, :status)
  end
=======
  params.require(:task).permit(:content)
  end
end
>>>>>>> 78386099eac4460015e3ef3d531527a433eb1f72
