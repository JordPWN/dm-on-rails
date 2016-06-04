configure do
  # Log queries to STDOUT in development
  if Sinatra::Application.development?
    ActiveRecord::Base.logger = Logger.new(STDOUT)
  end

  set :database, {
    host: 'ec2-54-235-246-220.compute-1.amazonaws.com',
    adapter: 'postgresql',  
    encoding: 'unicode',
    database: 'd2n6kf3uva1t36', 
    pool: 2, 
    username: 'lnktbakblxuwiu',
    password: 'JX8wc0frIv7ZBZoQXuVB_qu3eo',
    port: 5432
  }

  # Load all models from app/models, using autoload instead of require
  # See http://www.rubyinside.com/ruby-techniques-revealed-autoload-1652.html
  Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
    filename = File.basename(model_file).gsub('.rb', '')
    autoload ActiveSupport::Inflector.camelize(filename), model_file
  end

end

