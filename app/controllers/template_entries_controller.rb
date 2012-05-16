class TemplateEntriesController < ApplicationController
  # GET /template_entries
  # GET /template_entries.json
  def index
    @template_entries = TemplateEntry.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @template_entries }
    end
  end

  # GET /template_entries/1
  # GET /template_entries/1.json
  def show
    @template_entry = TemplateEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @template_entry }
    end
  end

  # GET /template_entries/new
  # GET /template_entries/new.json
  def new
    @template_entry = TemplateEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @template_entry }
    end
  end

  # GET /template_entries/1/edit
  def edit
    @template_entry = TemplateEntry.find(params[:id])
  end

  # POST /template_entries
  # POST /template_entries.json
  def create
    @template_entry = TemplateEntry.new(params[:template_entry])

    respond_to do |format|
      if @template_entry.save
        format.html { redirect_to @template_entry, notice: 'Template entry was successfully created.' }
        format.json { render json: @template_entry, status: :created, location: @template_entry }
      else
        format.html { render action: "new" }
        format.json { render json: @template_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /template_entries/1
  # PUT /template_entries/1.json
  def update
    @template_entry = TemplateEntry.find(params[:id])

    respond_to do |format|
      if @template_entry.update_attributes(params[:template_entry])
        format.html { redirect_to @template_entry, notice: 'Template entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @template_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /template_entries/1
  # DELETE /template_entries/1.json
  def destroy
    @template_entry = TemplateEntry.find(params[:id])
    @template_entry.destroy

    respond_to do |format|
      format.html { redirect_to template_entries_url }
      format.json { head :no_content }
    end
  end
end
