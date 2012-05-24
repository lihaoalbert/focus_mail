class Template < ActiveRecord::Base
  attr_accessible :file_name, :name, :source
  has_many :entries
  has_many :campaigns

  def source
    @source = IO.readlines(Rails.root.join('app/views/member_mailer', "#{self.file_name}.html.erb")).join("").strip
  end

  def source= (val)
    #p Rails.configuration.splitor_start
    #p Rails.configuration.splitor_end
    File.open(Rails.root.join("app/views/member_mailer", "#{self.file_name}.html.erb"), 'wb'){ |f| f.write(val) }
  end
end
