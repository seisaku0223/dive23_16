module ApplicationHelper
  def profile_img(user)
    return image_tag(user.avatar, alt: user.name) if user.avatar?
      img_url = 'no_image.png'
    image_tag(img_url, alt: user.name)
  end

  def contribution_vote_count(user)
    @count_vote = 0
    user.questions.each do |data|
      @count_vote += data.vote_users.count
    end
    return @count_vote
  end

  def contribution_answer_count(user)
    @count_answer = 0
    user.questions.each do |data|
      @count_answer += data.answers.count
    end
    return @count_answer
  end
end
