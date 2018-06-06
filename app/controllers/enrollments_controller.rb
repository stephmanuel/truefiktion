class EnrollmentsController < ApplicationController
  def index
    @enrollments = Enrollment.all

    render("enrollments/index.html.erb")
  end

  def show
    @enrollment = Enrollment.find(params[:id])

    render("enrollments/show.html.erb")
  end

  def new
    @enrollment = Enrollment.new

    render("enrollments/new.html.erb")
  end

  def create
    @enrollment = Enrollment.new

    @enrollment.issue_id = params[:issue_id]
    @enrollment.user_id = params[:user_id]

    save_status = @enrollment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/enrollments/new", "/create_enrollment"
        redirect_to("/enrollments")
      else
        redirect_back(:fallback_location => "/", :notice => "Enrollment created successfully.")
      end
    else
      render("enrollments/new.html.erb")
    end
  end

  def edit
    @enrollment = Enrollment.find(params[:id])

    render("enrollments/edit.html.erb")
  end

  def update
    @enrollment = Enrollment.find(params[:id])

    @enrollment.issue_id = params[:issue_id]
    @enrollment.user_id = params[:user_id]

    save_status = @enrollment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/enrollments/#{@enrollment.id}/edit", "/update_enrollment"
        redirect_to("/enrollments/#{@enrollment.id}", :notice => "Enrollment updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Enrollment updated successfully.")
      end
    else
      render("enrollments/edit.html.erb")
    end
  end

  def destroy
    @enrollment = Enrollment.find(params[:id])

    @enrollment.destroy

    if URI(request.referer).path == "/enrollments/#{@enrollment.id}"
      redirect_to("/", :notice => "Enrollment deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Enrollment deleted.")
    end
  end
end
