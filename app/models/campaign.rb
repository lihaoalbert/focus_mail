class Campaign < ActiveRecord::Base
  attr_accessible :from_email, :from_name, :name, :subject, :list_ids, :template_id, :entry

  has_many :campaign_lists
  has_many :lists, :through => :campaign_lists, uniq: true
  has_many :campaign_entries
  belongs_to :template
  attr_accessor :entry

  validates_presence_of :name, :template_id, :from_email, :from_name, :subject

  after_save :save_entry
  def save_entry
    if self.entry
      puts self.entry.to_yaml
      self.entry.each do |e|
        ce = CampaignEntry.where(campaign_id: self.id, entry_id: e[0].to_i).first_or_create
        ce.value = e[1]
        ce.save
      end
    end
  end

  def value_of_entry(entry)
    ce = CampaignEntry.where(campaign_id: self.id, entry_id: entry.id).first
    if ce
      ce.value
    end
  end

  def valid_entries
    CampaignEntry.where(campaign_id: self.id, :entry_id => self.template.entries.collect(&:id))
  end
end
