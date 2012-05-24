class ClicksController < ApplicationController
  # GET /clicks
  # GET /clicks.json
  def index
    @clicks = Click.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clicks }
    end
  end

  # GET /clicks/1
  # GET /clicks/1.json
  def show
    @click = Click.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @click }
    end
  end

  # GET /clicks/new
  # GET /clicks/new.json
  def new
    @click = Click.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @click }
    end
  end

  # GET /clicks/1/edit
  def edit
    @click = Click.find(params[:id])
  end

  # POST /clicks
  # POST /clicks.json
  def create
    @click = Click.new(params[:click])

    respond_to do |format|
      if @click.save
        format.html { redirect_to @click, notice: 'Click was successfully created.' }
        format.json { render json: @click, status: :created, location: @click }
      else
        format.html { render action: "new" }
        format.json { render json: @click.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clicks/1
  # PUT /clicks/1.json
  def update
    @click = Click.find(params[:id])

    respond_to do |format|
      if @click.update_attributes(params[:click])
        format.html { redirect_to @click, notice: 'Click was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @click.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clicks/1
  # DELETE /clicks/1.json
  def destroy
    @click = Click.find(params[:id])
    @click.destroy

    respond_to do |format|
      format.html { redirect_to clicks_url }
      format.json { head :no_content }
    end
  end
end
