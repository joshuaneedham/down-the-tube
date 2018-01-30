class FirearmsController < ApplicationController
  get '/firearms' do
    if logged_in?
      @firearms = Firearm.all
      erb :'firearms/firearms'
    else
      redirect to '/login'
    end
  end

  get '/firearms/new' do
    if logged_in?
      erb :'/firearms/create_firearm'
    else
      redirect to '/login'
    end
  end

  post '/firearms' do
    @firearm = current_user.firearms.create(:name => params["name"], :round_count => params["round_count"])
    redirect to "/firearms/#{@firearm.id}"
  end

  get '/firearms/:id' do
    if logged_in?
      @firearm = Firearm.find_by_id(params[:id])
      erb :'firearms/show_firearm'
    else
      redirect to '/login'
    end
  end

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


  patch '/firearms/:id' do
      @firearm = Firearm.find_by_id(params[:id])
      @firearm.name = params[:name]
      @firearm.round_count = params[:round_count]
      @firearm.save
      redirect to "/firearms/#{@firearm.id}"
  end

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
