class TasksController < ApplicationController
    
    def index
        @tasks = Task.all
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
