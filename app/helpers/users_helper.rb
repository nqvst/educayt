module UsersHelper
	def gravatar_for(user, options = { :size => 50 })
		gravatar_image_tag(user.email.downcase, :alt => user.name,
                                            :class => 'gravatar',
                                            :gravatar => options)

  end
  
  def user_feed
		feed = []
		current_user.following.each do |user|
			user.tutorials.each do |tutorial|
				feed.push(tutorial)
			end
		end
		@feed = feed
  end
end
