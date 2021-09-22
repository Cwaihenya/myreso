module TasksHelper
  def days_until_end(task)
      (@resolution.end_date.to_date - Time.now.localtime.to_date).to_i
    end
end
