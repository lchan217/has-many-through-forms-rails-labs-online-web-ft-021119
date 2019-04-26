class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  def user_attributes=(user_attributes)
    user_attributes.each do |i, attr|
      if user_attributes.comments.present? #prevents user being created if there's no comment
        user = User.find_or_create_by(attr)
                #user = User.find_or_create_by(username: attr[:username])
        if !self.users.include?(user)
          self.comments.build(user: user) #associates
        end
      end
    end
  end
end
