class TasksController < ApplicationController
    def new
        @task = Task.new
    end

    def create
        @task = Task.new(task_params)
        if @post.save
            redirect_to @post
        else
            render :new
        end
    end

    private

    def task_params
        params.require(:task).permit(:content)
    end
end
