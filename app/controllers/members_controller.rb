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

  def export
    @members = Member.all
    respond_to do |format|
      format.xls {
        send_data(xls_content_for(@members),
                  :type => "text/excel;charset=utf-8; header=present",
                  :filename => "Report_Members_#{Time.now.strftime("%Y%m%d%H%M")}.xls")
      }
    end
  end

  def imexport
    @list_id = params[:list_id]
  end

  def import
    @list = List.find(params[:list_id])

    excel_file = params[:excel_file]
    file = MemberUploader.new
    file.store!(excel_file)
    book = Spreadsheet.open "#{file.store_path}"
    sheet1 = book.worksheet 0
    @members = []
    @errors = Hash.new
    @counter = 0

    sheet1.each 1 do |row|
      @counter+=1
      p = Member.new
      Member.get_field_array.each_with_index do |field, i|
        p.send("#{field[0]}=", row[i])
      end

      if p.valid?
        p.list = @list
        p.save!
        @members << p
      else
        @errors["#{@counter+1}"] = p.errors
      end
    end
    file.remove!
  end

  def import_template
    respond_to do |format|
      format.xls {
        send_data(xls_content_for(nil),
                  :type => "text/excel;charset=utf-8; header=present",
                  :filename => "Template_Members_#{Time.now.strftime("%Y%m%d%H%M")}.xls")
      }
    end
  end

  private
  def xls_content_for(objs)
    xls_report = StringIO.new
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet :name => "Members"

    blue = Spreadsheet::Format.new :color => :blue, :weight => :bold, :size => 10
    sheet1.row(0).default_format = blue

    sheet1.row(0).concat Member.get_field_array.collect{|arr| arr[1] }
    count_row = 1
    if objs
      objs.each do |obj|
        columns = Member.get_field_array.collect{|arr| arr[0] }
        columns.each_with_index do |column_name, i|
          sheet1[count_row, i] = obj.send(column_name)
        end
        count_row += 1
      end
    end

    book.write xls_report
    xls_report.string
  end

end
