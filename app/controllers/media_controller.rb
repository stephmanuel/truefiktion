class MediaController < ApplicationController
  def index
    @q = Medium.ransack(params[:q])
    @media = @q.result(:distinct => true).includes(:stage).page(params[:page]).per(10)

    render("media/index.html.erb")
  end

  def show
    @medium = Medium.find(params[:id])

    render("media/show.html.erb")
  end

  def new
    @medium = Medium.new

    render("media/new.html.erb")
  end

  def create
    @medium = Medium.new

    @medium.week_id = params[:week_id]
    @medium.stage_id = params[:stage_id]
    @medium.article = params[:article]
    @medium.video = params[:video]

    save_status = @medium.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/media/new", "/create_medium"
        redirect_to("/media")
      else
        redirect_back(:fallback_location => "/", :notice => "Medium created successfully.")
      end
    else
      render("media/new.html.erb")
    end
  end

  def edit
    @medium = Medium.find(params[:id])

    render("media/edit.html.erb")
  end

  def update
    @medium = Medium.find(params[:id])

    @medium.week_id = params[:week_id]
    @medium.stage_id = params[:stage_id]
    @medium.article = params[:article]
    @medium.video = params[:video]

    save_status = @medium.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/media/#{@medium.id}/edit", "/update_medium"
        redirect_to("/media/#{@medium.id}", :notice => "Medium updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Medium updated successfully.")
      end
    else
      render("media/edit.html.erb")
    end
  end

  def destroy
    @medium = Medium.find(params[:id])

    @medium.destroy

    if URI(request.referer).path == "/media/#{@medium.id}"
      redirect_to("/", :notice => "Medium deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Medium deleted.")
    end
  end
end
