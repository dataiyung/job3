class Admin::JobsController < ApplicationController
before_action :authenticate_user!, only: [:new, :edit, :update,:destroy, :create]
before_action :require_is_admin
def index
@jobs= Job.all
end

def new
  @job= Job.new
end

def show
  @job= Job.find(params[:id])
end

def edit
  @job= Job.find(params[:id])
end


def create
  @job= Job.new(jobs_params)
  if @job.save
    redirect_to admin_jobs_path
else
    render :new
  end
end

def update
  @job=Job.find(params[:id])
  if @job.update(job_params)
    redirect_to admin_jobs_path
  else
    render :edit
  end
end

def destroy
  @job= Job.find(params[:id])
  @job.destroy
  redirect_to admin_jobs_path
end

def require_is_admin
  if !current_user.admin?
    flash[:alert] = 'you are not 月老'
   redirect_to root_path
   end
end

private

def jobs_params
  params.require(:job).permit(:title, :description, :age_upper_limit, :age_lower_limit, :contact_email, :is_hidden)
end
end
