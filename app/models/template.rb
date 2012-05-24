class Template < ActiveRecord::Base
  attr_accessible :file_name, :name, :source
  has_many :entries
  has_many :campaigns

  def source
    @source = IO.readlines(File.expand_path("../../views/member_mailer/#{self.file_name}.html.erb", __FILE__)).join("").strip
  end

  def source= (val)
    File.open(File.expand_path("../../views/member_mailer/#{self.file_name}.html.erb", __FILE__), 'wb'){ |f| f.write(val) }
  end
end
