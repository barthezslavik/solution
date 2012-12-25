class SamplesController < ApplicationController
  before_filter :find_samples_by_category, :only => [:index, :custom, :draft]
  simple_action :index, :draft, :custom

  def show
    @sample = Sample.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sample }
    end
  end

  def new
    @sample = Sample.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sample }
    end
  end

  def edit
    @sample = Sample.find(params[:id])
  end

  def create
    @sample = Sample.new(params[:sample])

    respond_to do |format|
      if @sample.save
        format.html { redirect_to @sample, notice: 'Sample was successfully created.' }
        format.json { render json: @sample, status: :created, location: @sample }
      else
        format.html { render action: "new" }
        format.json { render json: @sample.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @sample = Sample.find(params[:id])

    respond_to do |format|
      if @sample.update_attributes(params[:sample])
        format.html { redirect_to @sample, notice: 'Sample was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sample.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sample = Sample.find(params[:id])
    @sample.destroy

    respond_to do |format|
      format.html { redirect_to samples_url }
      format.json { head :no_content }
    end
  end

  private

  def find_samples_by_category
    category_name = case params[:action]
                when "index" then "Main"
                when "custom" then "Custom"
                when "draft" then "Draft"
                end
    category = Category.find_by_name(category_name)
    @samples = Sample.find_all_by_category_id(category.id) rescue []
  end
end
