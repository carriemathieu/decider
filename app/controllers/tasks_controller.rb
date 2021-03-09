class TasksController < ApplicationController
    before_action :redirect_if_not_logged_in
    
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

    private

    def task_params
        params.require(:task).permit(:content)
    end
end
