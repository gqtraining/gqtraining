# lib/task.rb
class Task
  attr_accessor :title, :status
  def complete!
    @status="completed"
  end
  def uncomplete!
    @status="pending"
  end
  def completed?
    @status=="completed"
  end
  def format
    content = @title
    content += " [done]" if completed?
    content
  end
  def self.create(content)
    t = Task.new
    t.status="pending"
    if(content=~/\[done\]/i)
      t.status="completed"
      content.gsub!(/\[done\]/i, "")
    end
    t.title = content.strip
    t
  end
end
