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
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = "task が正常に投稿されました"
      redirect_to @task
    else
      flash.now[:danger] = "task が投稿されませんでした"
      render :new
    end
  end

  def edit
    @task = Task.fnd(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = "taskは正常に送信されました"
      redirect_to @task
    else 
      flash.now[:danger] = "taskは更新されませんでした"
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = "taskは正常に削除されました"
    redirect_to tasks_url
  end
end
