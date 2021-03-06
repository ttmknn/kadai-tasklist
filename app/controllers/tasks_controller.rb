class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :require_user_logged_in, only: [:show, :new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  def index
    if logged_in?
      @task = current_user.tasks.build  # form_for 用
      @tasks = current_user.tasks.order('created_at DESC').page(params[:page])
    end
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = 'タスクが正常に登録されました'
      redirect_to @task
    else
    @tasks = current_user.tasks.order('created_at DESC').page(params[:page])
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
    @task.destroy
    flash[:success] = 'タスクは正常に削除されました'
    redirect_to root_url
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
   params.require(:task).permit(:content, :status, :user_id)
  end

  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end

end
