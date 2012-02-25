namespace :heroku do

  def precompile_assets
    system 'rake assets:precompile'
  end
  
  def git_checkin
    system 'git add .'
    system "git commit -am 'deploying to Heroku at #{Time.now}'"
  end
  
  def heroku_push
    system 'git push heroku master'
  end
  
  def clean_assets
    system 'rake assets:clean'   
  end
  
  task :deploy do
    puts "\nPreparing application for deployment to Heroku at #{Time.now}\n\n"
    clean_assets()
    precompile_assets()
    git_checkin()
    heroku_push()
    clean_assets()
    puts "\nApplication deployed to Heroku at #{Time.now}"
  end

end