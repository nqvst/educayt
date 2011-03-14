require 'digest'

class User < ActiveRecord::Base
  attr_accessor 	:password
  attr_accessible 	:id,
            :name,
  					:email,
  					:password,
  					:password_confirmation,
  					:bio,
            :uid
  has_many :subscriptions, :foreign_key => :user_id, :dependent => :destroy

  has_many :notifications
         
  has_many :relationships, 			:foreign_key => "follower_id", 
  									:dependent => :destroy
  has_many :reverse_relationships, 	:foreign_key => "followed_id",
                                   	:class_name => "Relationship",
                                   	:dependent => :destroy
  has_many :followers, :through => 	:reverse_relationships
  has_many :following, :through => :relationships, :source => :followed
  
  has_many 	:tutorials,
  			:dependent		=> :destroy
  has_many :tutorial_parts, :through => :tutorials

  has_many :comments

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,
          	:presence 		=> true,
            :length   		=> { :maximum => 50 , :minimum => 3 }

  validates :email,
            :presence   	=> true,
            :format     	=> { :with => email_regex },
            :uniqueness 	=> { :case_sensitive => false }

  validates :password,
            :presence     => true,
            :confirmation => true,
            :length       => { :within => 6..40 }    

 
  default_scope :order => 'users.name DESC'

  after_create :generate_activation_code,  :followablize
  before_save :encrypt_password

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end

  #following
  def following?(followed)
    relationships.find_by_followed_id(followed)
  end

  def follow!(followed)
    relationships.create!(:followed_id => followed.id)
  end

  def unfollow!(followed)
    relationships.find_by_followed_id(followed).destroy
  end
  def activ?
    activated
  end
  def forgot_password!
    new_pass = generate_random_string(9)
    self.password = new_pass
    save
    UserMailer.forgotten_password(self, new_pass).deliver
  end
  def activate_account?
    User.update(self.id, {:activated => true})
  end
  def facebook_user?
    return !self.uid.nil?
  end
  def correct_activation_code?(code_to_compare_with)
    self.activation_code.eql?(code_to_compare_with)
  end
  #checks if user changed email when updating
  def changed_email?(email)
   ! self.email.eql?(email)
  end
  def deactivate_account?
    activation_code = generate_activation_code
    User.update(self.id, {:activated => false, :activation_code => activation_code})
  end
  def reset_account_activation
    if self.deactivate_account
      UserMailer.account_activation_instructions(self.id)
    end
  end

  def update_from_child(updated_object, action)
    notify(action, updated_object)
  end
  # =========
  private
  def encrypt_password
    self.salt = make_salt if new_record?
    self.encrypted_password = encrypt(password)
  end
#generates random string
  def generate_random_string( length )
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    new = ""
    1.upto(length) { |i| new << chars[rand(chars.size-1)] }
    return new
  end
  def encrypt(string)
    secure_hash("#{salt}--#{string}")
  end

  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end
  def generate_activation_code
    if self.id.nil?
       string_to_encrypt = "#{email}--#{generate_random_string( 6 )}"
       self.activation_code = secure_hash(string_to_encrypt)
    end
  end
  def followablize
     FollowablesHelper.make_followable(self)
  end

  def notify(action, updated_object)
    followable_object = FollowablesHelper.get_followable(self)
    NotificationsHelper.create_notifications(followable_object, updated_object, action)
    get_parents.each do |p|
      p.update_from_child(updated_object, action)
    end
  end

  def get_parents
    parents = []
    return parents
  end
end
