class HighfiveController < ApplicationController
  def transter_highfive
    puts 'transfer'
    user_to = User.find(todo_params[:user_to])

    count = todo_params[:count]
    puts current_user.to_s
    if add_high_five(current_user, user_to, count)
      json_response({"message" => "success"})
    else
      json_response({"message" => "fail"})
    end
  end

  private

  def add_high_five(from, to, count)
    return false if from.highfive < count
    to.add_highfive(count)
    from.add_highfive(-count)
    to.save!
    from.save!
    highfive_log(from, to, count)
    true
  end

  def highfive_log(from, to, count)
    HighFiveLog.create!(:user_to => to.id, :user_from => from.id, :count => count)
  end

  def todo_params
    params.permit(:user_to, :count, :highfive)
  end
end
