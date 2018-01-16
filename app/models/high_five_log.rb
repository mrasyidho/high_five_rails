class HighFiveLog < ApplicationRecord

  validates_presence_of :user_to, :user_from, :count, :comment
end
