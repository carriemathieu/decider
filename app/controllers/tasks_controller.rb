class TasksController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_task_author, only: [:edit, :update, :destroy]
    
    def index
        if params[:user_id] # checks if post ID & id exists are true
            user = User.find_by(id: params[:user_id])
            @tasks = user.tasks
        else
            @tasks = Task.all
        end
    end
    
    def new
        @task = Task.new
    end

    def create
        @task = current_user.tasks.build(task_params)
        if @task.save
            redirect_to tasks_path
        else
            render :new
        end
    end

    def show
        @task = Task.find_by(id: params[:id])
    end

    def edit
    end

    def update
        if @task.update(task_params)
            redirect_to task_path(@task)
        else
            render :edit
        end
    end

    def destroy
        @task.destroy
        flash[:notice] = "Artist deleted."
        redirect_to tasks_path
    end

    private

    def task_params
        params.require(:task).permit(:content)
    end


    def set_task
        @task = Task.find_by(id: params[:id])
        if !@task 
            flash[:message] = "Task was not found."
        end
    end

    def redirect_if_not_task_author
        redirect_to task_path if @task.user != current_user
    end
end
