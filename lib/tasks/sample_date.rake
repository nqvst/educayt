require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    User.create!(:name => 'Natalia', :email => 'natalia@natalia.natalia', :password => 'passpass')
    User.create!(:name => 'Ymer', :email => 'ymer@ymer.ymer', :password => 'passpass')

    User.all(:limit => 6).each do |user|
      50.times do
        user.tutorials.create!(:name => Faker::Lorem.sentence(2), :description => Faker::Lorem.sentence(5))
      end
    end
    Tutorial.all.each do |tutorial|
      3.times do |count|
        tutorial.tutorial_parts.create!(
                            :description => Faker::Lorem.sentence(5),
                            :title => 'min titel',
                            :content_text => Faker::Lorem.paragraph(8),
                            :in_order => count + 1
                          )
      end
    end
  end
end

