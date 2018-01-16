class HighFiveLogSerializer < ActiveModel::Serializer
  attributes :from, :count, :comment, :created_at

  def from
    User.find(object.user_from).name
  end

  def created_at
    object.created_at.strftime('%Y-%m-%d %H:%M:%S')
  end
end
