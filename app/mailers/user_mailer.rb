class UserMailer < ActionMailer::Base
  
  def account_activation_instructions(user_id)
    @user = User.find(user_id)
    @host = ""
    #attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    mail( :from => "educaytme@gmail.com", :to => "<#{@user.email}>", :subject => "Registered")
  end
  def forgotten_password(user_id, generated_password)
    @user = User.find(user_id)
    @generated_password = generated_password
    #attachments["rails.png "]= File.read("#{Rails.root}/public/images/rails.png")
    mail( :from => "educaytme@gmail.com", :to => "<#{user.email}>", :subject => "Your new password")
  end
  def activation_confirmation(user_id)
    @user = User.find(user_id)
    mail(:from => "educaytme@gmail.com", :to => "<#{user.email}>", :subject => "Welcome to EducaytMe!")
  end
end