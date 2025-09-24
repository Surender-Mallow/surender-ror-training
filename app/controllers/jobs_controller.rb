class JobsController < ApplicationController
    before_action :set_job, only: %i[ show edit update destroy ]

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: "job created successfully." }
        format.json { render :show, location: @job, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: "job updated successfully." }
        format.json { render :show, location: @job, status: :created }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @job.destroy!

    respond_to do |format|
      format.html { redirect_to jobs_path, notice: "job  destroyed successfully.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.expect(job: [ :title, :description, :location, :salary, :company_id ])
  end
end
