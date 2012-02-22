namespace :heroku do

  # Precompile all assets 
  # Commit to git 
  # Deploy to heroku
  
  def precompile_assets
    system 'rake assets:procompile'
  end
  
  def git_checkin
    system 'git add .'
    system "git commit -am 'deploying to Heroku at #{Time.now}'"
  end
  
  def heroku_push
    system 'git push heroku master'
  end
  
  task :deploy do
    puts "\nPreparing application for deployment to Heroku at #{Time.now}\n\n"
    precompile_assets()
    git_checkin()
    heroku_push()
    puts "\nApplication deployed to Heroku at #{Time.now}"
  end

end