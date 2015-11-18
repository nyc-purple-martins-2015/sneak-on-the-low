module UserRelationships

  def voteable_by?(user)
    user && !( voted_on_by?(user) || authored_by?(user) )
  end

  def authored_by?(user)
    self.author == user
  end

  private

  def voted_on_by?(user)
    votes.where(user_id: user.id).exists?
  end
end