# lib/taskr.rb
require 'task'
class Taskr
  attr_accessor :tasks
  def initialize(file_path="todo_list.txt")
    @file_path=file_path
  end
  def file_path
    @file_path
  end
  def load_tasks!
    @tasks = File.read(@file_path).lines.map { |line| Task.create(line) }
    #@tasks = []
    #lines = File.read("todo_list.txt").lines
    #lines.each do |l|
      #@tasks << Task.create(l)
    #end
    #@tasks
  end
  def task_at(position)
    @tasks[position-1]
  end
  def save_tasks!
    content=@tasks.map { |t| t.format }.join("\n")
    File.open(file_path,'w') do |f|
      f.write content
    end
  end
  def completed
    @tasks.select {|t| t.completed? }
  end
end
