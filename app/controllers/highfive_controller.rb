class HighfiveController < ApplicationController
  def transter_highfive
    puts 'transfer'
    user_to = User.find(todo_params[:user_to])

    count = todo_params[:count]
    puts current_user.to_s
    if add_high_five(current_user, user_to, count)
      json_response_data({"message" => "success"})
    else
      json_response_data({"message" => "fail"})
    end
  end

  def get_current_highfive
    json_response_data({"highfive" => current_user.highfive})
  end

  def top_highfive_score
    top_user = User.all.order(highfive: :desc).map{|a| {"name" => a.name, "highfive" => a.highfive}}
    json_response_data(top_user)
  end

  def get_highfive_contributor
    highfive_log_list = HighFiveLog.where(:user_to => current_user.id)
    json_response_data(highfive_log_list)
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
