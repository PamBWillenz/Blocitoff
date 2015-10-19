desc "This task is called by the Heroku scheduler add-on"
task :delete_items => :environment do 
  items = Item.where("created_at <=?", Time.now - 7.days).destroy_all  
end