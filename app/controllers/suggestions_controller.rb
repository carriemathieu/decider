class SuggestionsController < ApplicationController

    def index
        if params[:task_id] && @task = Task.find_by_id(params[:task_id]) # checks if post ID & id exists are true
            @suggestions = @task.suggestions
        else
            @error = "That task doesn't exist" if params[:post_id]
            @suggestions = Suggestion.all
        end
    end

    def new
        if params[:task_id] && @task = Task.find_by_id(params[:task_id])
            @suggestion = @task.suggestions.build
        else
            @error = "That task doesn't exist" if params[:post_id]
            @suggestions = Suggestion.all
        end
    end

    def create
        @suggestion = current_user.suggestions.build(suggestion_params)
        if @suggestion.save
            redirect_to suggestions_path
        else
            render :new
        end
    end

    def show
    end
    private
    
    def suggestion_params
        params.require(:suggestion).permit(:content, :task_id)
    end
    # add all suggestions to an array
    # [array].sample OR [array].shuffle.first
end
