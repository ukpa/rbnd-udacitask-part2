require 'colorize'
module Listable
  # Listable methods go here
  def format_description(description)
    "#{description}".ljust(30)
  end

  def format_priority(priority)
    value = " ⇧".colorize(:color=>:red,:background=>:white) if priority == "high"
    value = " ⇨".colorize(:color=>:yellow,:background=>:white) if priority == "medium"
    value = " ⇩".colorize(:color=>:green,:background=>:white) if priority == "low"
    value = "" if !priority
    return value
  end

  def format_date(*date)
    if date.length ==1
      return  date[0] ? date[0].strftime("%D") : "No due date"
    else
      dates = date[0].strftime("%D") if date[0]
      dates << " -- " + date[1].strftime("%D") if date[1]
      dates = "N/A" if !dates
      return dates
    end
  end
end
