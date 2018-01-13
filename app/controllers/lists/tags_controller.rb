class Lists::TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.most_used(25)
    # @tags = Question.all_tags
  end

  def show
    @tag=ActsAsTaggableOn::Tag.find_by(name: params[:name])
    @question = Question.tagged_with(@tag.name)
  end
end
