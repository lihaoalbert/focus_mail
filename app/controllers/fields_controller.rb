class FieldsController < ApplicationController

  def new
    @field_group = FieldGroup.find(params[:field_group_id])
    @field = @field_group.fields.build

    respond_to do |format|
      format.js
    end
  end

  def edit
    @field_group = FieldGroup.find(params[:field_group_id])
    @field = @field_group.fields.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def create
    @field_group = FieldGroup.find(params[:field_group_id])
    @field = @field_group.fields.create(params[:field])

    respond_to do |format|
      if @field.save
        format.js
      else
        format.js { render action: "new" }
      end
    end
  end

  def update
    @field_group = FieldGroup.find(params[:field_group_id])
    @field = @field_group.fields.find(params[:id])

    respond_to do |format|
      if @field.update_attributes(params[:field])
        format.js
      else
        format.js { render action: "edit" }
      end
    end
  end

  def destroy
    @field_group = FieldGroup.find(params[:field_group_id])
    @field = @field_group.fields.find(params[:id])
    @field.destroy

    respond_to do |format|
      format.js
    end
  end
end
