require 'bundler'
Bundler.require

Dir.glob('./lib/*.rb') do |model|
  require model
end

module Name
  class App < Sinatra::Application

    #configure
    configure do
      set :root, File.dirname(__FILE__)
      set :public_folder, 'public'
    end

    #database
    DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/spacecats.db")

    #routes

    get '/spacecats' do
      @spacecats = SpaceCat.all
      erb :index
    end

    get '/spacecats/new' do
       erb :new
    end

    get '/spacecats/:id' do
      @spacecat = SpaceCat.get(params[:id])
      erb :show
    end
    
    post '/spacecats/new' do
      @spacecat = SpaceCat.new(params[:spacecat])
      if @spacecat.save
        redirect '/spacecats/' + @spacecat.id.to_s
      else
        erb :new
      end
    end


    #helpers
    helpers do
      def partial(file_name)
        erb file_name, :layout => false
      end
    end

    DataMapper.auto_upgrade! #Update the DB, ez migration

  end
end
