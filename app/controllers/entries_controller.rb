class EntriesController < ApplicationController

  def new
    @template = Template.find(params[:template_id])
    @entry = @template.entries.build

    respond_to do |format|
      format.js
    end
  end

  def edit
    @template = Template.find(params[:template_id])
    @entry = @template.entries.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def create
    @template = Template.find(params[:template_id])
    @entry = @template.entries.create(params[:entry])

    respond_to do |format|
      if @entry.save
        format.js
      else
        format.js { render action: "new" }
      end
    end
  end

  def update
    @template = Template.find(params[:template_id])
    @entry = @template.entries.find(params[:id])

    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        format.js
      else
        format.js { render action: "edit" }
      end
    end
  end

  def destroy
    @template = Template.find(params[:template_id])
    @entry = @template.entries.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.js
    end
  end
end
