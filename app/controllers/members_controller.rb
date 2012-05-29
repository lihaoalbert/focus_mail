class MembersController < ApplicationController

  def index
    @list = List.find(params[:list_id])
    @members = @list.members.paginate(:page => params[:page], :per_page => 20)
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

  def destroy
    @list = List.find(params[:list_id])
    @member = @list.members.find(params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to list_members_path(@list.id) }
      format.json { head :no_content }
    end
  end

  def export
    @members = List.find(params[:list_id]).members

    respond_to do |format|
      format.xls {
        send_data(xls_content_for(@members),
                  :type => "text/excel;charset=utf-8; header=present",
                  :filename => "Report_Members_#{Time.now.strftime("%Y%m%d%H%M")}.xls")
      }
      format.csv {
        send_data(csv_content_for(@members),
                  :type => "text/csv;charset=utf-8; header=present",
                  :filename => "Report_Members_#{Time.now.strftime("%Y%m%d%H%M")}.csv")
      }
    end
  end

  def imexport
    @list_id = params[:list_id]
  end

  def import
    require 'csv'
    @list = List.find(params[:list_id])
    file = MemberUploader.new
    file.store!(params[:file])
    @members = []
    @errors = Hash.new
    @counter = 0

    if params[:type] == 'xls'
      # import from excel
      book = Spreadsheet.open "#{file.store_path}"
      sheet1 = book.worksheet 0

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
    else
      # import from csv
      CSV.foreach(file.store_path, :headers => true) do |row|
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
      format.csv {
        send_data(csv_content_for(nil),
                  :type => "text/excel;charset=utf-8; header=present",
                  :filename => "Template_Members_#{Time.now.strftime("%Y%m%d%H%M")}.csv")
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
      columns = Member.get_field_array.collect{|arr| arr[0] }
      objs.each do |obj|
        columns.each_with_index do |column_name, i|
          sheet1[count_row, i] = obj.send(column_name)
        end
        count_row += 1
      end
    end

    book.write xls_report
    xls_report.string
  end

  def csv_content_for(objs)
    require 'csv'
    csv = CSV.generate(:force_quotes => true) do |line|
      column_labels = Member.get_field_array.collect{|arr| arr[1] }
      line << column_labels
      if objs
        columns = Member.get_field_array.collect{|arr| arr[0] }
        arr = []
        objs.each do |obj|
          columns.each do |column_name|
            arr << obj.send(column_name)
          end
          line << arr
          arr = []
        end
      end
    end
    csv
  end

end
