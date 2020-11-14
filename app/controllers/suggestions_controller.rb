class SuggestionsController < ApplicationController

    def index
        if params[:post_id] && @post = Post.find_by_id(params[:post_id]) # nested route & can find post ID
            @suggestions = @task.suggestions
        else
            @error = "That task doesn't exist" if params[:post_id]
            @suggestions = Suggestion.all
        end
    end

    # add all suggestions to an array
    # [array].sample OR [array].shuffle.first
end
