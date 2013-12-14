# spec/task_spec.rb
require 'spec_helper'
describe Task do
  context "completed task" do
    before do
      @task=Task.create("Buy milk [Done]")
    end
    it "should parse the task status for completed task" do
      @task.title.should=="Buy milk"
      @task.status.should=="completed"
    end
    it "should uncomplete task" do
      @task.uncomplete!
      @task.status.should=="pending"
    end
    it "should format completed task" do
      @task.format.should=="Buy milk [done]"
    end
    it "should be completed" do
      @task.completed?.should be_true
    end
  end
  context "pending task" do
    before do
      @task = Task.create("Learn ruby")
    end
    it "should complete task" do
      @task.complete!
      @task.status.should=="completed"
    end
    it "should parse the task status for pending task" do
      @task.title.should=="Learn ruby"
      @task.status.should=="pending"
    end
    it "should format completed task" do
      @task.format.should=="Learn ruby"
    end
    it "should be completed" do
      @task.completed?.should be_false
    end
  end
end
