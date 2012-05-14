class MembersController < ApplicationController

  def index
    @list = List.find(params[:list_id])
    @members = @list.members
  end

  def show
    @list = List.find(params[:list_id])
    @member = Member.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @member }
    end
  end

  def new
    @list = List.find(params[:list_id])
    @member = @list.members.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @member }
    end
  end

  def edit
    @list = List.find(params[:list_id])
    @member = @list.members.find(params[:id])
  end

  # POST /members
  # POST /members.json
  def create
    @list = List.find(params[:list_id])
    @member = @list.members.create(params[:member])

    respond_to do |format|
      if @member.save
        format.html { redirect_to list_member_path(@list.id, @member.id), notice: 'Member was successfully created.' }
        format.json { render json: @member, status: :created, location: @member }
      else
        format.html { render action: "new" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /members/1
  # PUT /members/1.json
  def update
    @list = List.find(params[:list_id])
    @member = @list.members.find(params[:id])

    respond_to do |format|
      if @member.update_attributes(params[:member])
        format.html { redirect_to list_member_path(@list.id, @member.id), notice: 'Member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @list = List.find(params[:list_id])
    @member = @list.members.find(params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :no_content }
    end
  end
end
