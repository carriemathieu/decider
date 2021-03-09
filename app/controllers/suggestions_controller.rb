class SuggestionsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_suggestion, only: [:show, :edit, :update]
    before_action :redirect_if_not_suggestion_author, only: [:edit, :update]

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

    def edit 
    end

    def update
        if @suggestion.update(suggestion_params)
            redirect_to suggestion_path(@suggestion)
        else
            render :edit
        end
    end

    private
    
    def suggestion_params
        params.require(:suggestion).permit(:content, :task_id)
    end

    def set_suggestion
        @suggestion = Suggestion.find_by(id: params[:id])
        if !@suggestion 
            flash[:message] = "Task was not found."
        end
    end

    def redirect_if_not_suggestion_author
        redirect_to suggestions_path if @suggestion.user != current_user
    end

    # add all suggestions to an array
    # [array].sample OR [array].shuffle.first
end
