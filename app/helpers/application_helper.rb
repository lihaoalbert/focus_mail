module ApplicationHelper
  def full_title(page_title)
    base_title = "Focus Mail"
    if page_title.empty?
      base_title
    else
      %Q{#{base_title} | #{page_title}}
    end
  end

  def replace_email_source(campaign_id, member_id)
    campaign = Campaign.find(campaign_id)
    source = IO.readlines(Rails.root.join('lib/emails', "#{campaign.template.file_name}.html.erb")).join("").strip

    # replace all campaign_entries
    entries = campaign.valid_entries
    entries.each do |e|
      v = e.value
      # replace all links with virtual url
      if %r{^http://(.*)}.match(e.value)
        # create a link
        link = Link.where(:url => v).first_or_create
        v = "http://#{Rails.configuration.host_with_port}/click?u=#{member_id}&c=#{campaign.id}&l=#{link.id}"
      end

      source = source.gsub(/\$\|#{e.entry.name}\|\$/, v)
    end

    source
  end

end
