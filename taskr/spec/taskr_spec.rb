require 'spec_helper'
describe Taskr do
  subject { Taskr.new("spec/fixtures/todo_list.txt") }
  before { subject.load_tasks! }
  it "should be able to load tasks from todo_list.txt" do
    subject.tasks.count.should == 4
  end
  it "should be able to return a task at a given position" do
    t= subject.task_at(1)
    t.title.should=="Buy Milk"
    t.status.should=="completed"
  end
  it "should get a count of completed tasks" do
    subject.completed.count.should==1
  end
  it "should be able to save tasks" do
    subject.stub(:file_path).and_return("/tmp/tmp_todo_list.txt")
    t= subject.task_at(2)
    t.complete!
    subject.save_tasks!
    content= <<EOQ
Buy Milk [done]
Learn Ruby [done]
Learn Rspec
Learn Cucumber
EOQ
    File.read('/tmp/tmp_todo_list.txt').should==content.strip
  end
end
