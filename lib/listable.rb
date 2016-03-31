module Listable
  # Listable methods go here
  def format_description(description)
    "#{description}".ljust(30)
  end

  def format_priority(priority)
    value = " ⇧" if priority == "high"
    value = " ⇨" if priority == "medium"
    value = " ⇩" if priority == "low"
    value = "" if !priority
    return value
  end

  def format_date(*date)
    if date.length ==1
      return  date[0] ? date.strftime("%D") : "No due date"
    else
      dates = date[0].strftime("%D") if date[0]
      dates << " -- " + date[1].strftime("%D") if date[1]
      dates = "N/A" if !dates
      return dates
    end
  end
end
