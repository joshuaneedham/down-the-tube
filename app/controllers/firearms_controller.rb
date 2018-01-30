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

end
