class JobsController < ApplicationController
  def show
    @job = Job.find(param[:id])
  end

  def index
    @jobs =Job.all
  end

end
