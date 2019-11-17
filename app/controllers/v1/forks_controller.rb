class V1::ForksController < ApplicationController
  before_action :authenticate_user!

  def create
    recipe = Recipe.find(params[:recipe_id])
    if recipe.fork(current_user) 
      render json: { message: 'The recipe was successfully forked'}, status: 201
    else
      render json: { error_message: 'Could not complete the fork'}, status: 422
    end
  end
end