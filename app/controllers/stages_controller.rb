class StagesController < ApplicationController
  def index
    @q = Stage.ransack(params[:q])
    @stages = @q.result(:distinct => true).includes(:issue, :media).page(params[:page]).per(10)

    render("stages/index.html.erb")
  end

  def show
    @medium = Medium.new
    @stage = Stage.find(params[:id])

    render("stages/show.html.erb")
  end

  def new
    @stage = Stage.new

    render("stages/new.html.erb")
  end

  def create
    @stage = Stage.new

    @stage.issue_id = params[:issue_id]
    @stage.stage_number = params[:stage_number]

    save_status = @stage.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/stages/new", "/create_stage"
        redirect_to("/stages")
      else
        redirect_back(:fallback_location => "/", :notice => "Stage created successfully.")
      end
    else
      render("stages/new.html.erb")
    end
  end

  def edit
    @stage = Stage.find(params[:id])

    render("stages/edit.html.erb")
  end

  def update
    @stage = Stage.find(params[:id])

    @stage.issue_id = params[:issue_id]
    @stage.stage_number = params[:stage_number]

    save_status = @stage.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/stages/#{@stage.id}/edit", "/update_stage"
        redirect_to("/stages/#{@stage.id}", :notice => "Stage updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Stage updated successfully.")
      end
    else
      render("stages/edit.html.erb")
    end
  end

  def destroy
    @stage = Stage.find(params[:id])

    @stage.destroy

    if URI(request.referer).path == "/stages/#{@stage.id}"
      redirect_to("/", :notice => "Stage deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Stage deleted.")
    end
  end
end
