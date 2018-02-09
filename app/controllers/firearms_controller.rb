class FirearmsController < ApplicationController
  # Routes to list of all user firearms
  get '/firearms' do
    if logged_in?
      @firearms = Firearm.all
      erb :'firearms/firearms'
    else
      redirect to '/login'
    end
  end

    # Form for creating a new firearm
  get '/firearms/new' do
    if logged_in?
      erb :'/firearms/create_firearm'
    else
      redirect to '/login'
    end
  end

    # POST Action for saving firearm form to DB
  post '/firearms' do
    @firearm = current_user.firearms.create(:name => params["name"], :round_count => params["round_count"])
    redirect to "/firearms/#{@firearm.id}"
  end

    # Individual Firearm View Page
  get '/firearms/:id' do
    if logged_in?
      @firearm = Firearm.find_by_id(params[:id])
      erb :'firearms/show_firearm'
    else
      redirect to '/login'
    end
  end

    # Form page for editing a firearm
  get '/firearms/:id/edit' do
    if logged_in?
      @firearm = Firearm.find_by_id(params[:id])
      if @firearm.user_id == current_user.id
        erb :'firearms/edit_firearm'
      else
        redirect to '/firearms'
      end
    else
      redirect to '/login'
    end
  end


    # PATCH method for updating existing firearm record in DB requires "_method"
  patch '/firearms/:id' do
      @firearm = Firearm.find_by_id(params[:id])
      @firearm.name = params[:name]
      @firearm.round_count = params[:round_count]
      @firearm.save
      redirect to "/firearms/#{@firearm.id}"
  end

    # Deletes firearm record from DB
  delete '/firearms/:id/delete' do
    if logged_in?
      @firearm = Firearm.find_by_id(params[:id])
      if @firearm.user_id == current_user.id
        @firearm.delete
        redirect to '/firearms'
      else
        redirect to '/firearms'
      end
    else
      redirect to '/login'
    end
  end

end
