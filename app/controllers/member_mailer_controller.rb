class MemberMailerController < ApplicationController
  layout false

  def preview
    source = IO.readlines(Rails.root.join('app/views/member_mailer', "#{params[:file_name]}.html.erb")).join("").strip
    source = source.gsub(/$|NAME|$/, 'neosoyn')

    respond_to do |format|
      format.html { render :text => source }
    end

  end
end
