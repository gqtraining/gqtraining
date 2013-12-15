Given(/^that I have a list of tasks available$/) do |task_table|
  task_table.hashes.each do |task_attributes|
    Task.create task_attributes
  end
end
When(/^I create a new task "(.*?)"$/) do |title|
  Task.create :title=>title
end

Then(/^I should be able to see the "(.*?)" task$/) do |title|
  @tasks = Task.all
  @tasks.collect {|t| t[:title]}.should include(title)
end

Given(/^that I have a task "(.*?)"$/) do |title|
  @task = Task.create :title=>title
end

When(/^I edit the task to read "(.*?)"$/) do |title|
  @task.update(:title=>title)
end

Then(/^I should be able to see "(.*?)" instead of "(.*?)"$/) do |new_title, old_title|
  @tasks = Task.all
  @tasks.collect {|t| t[:title]}.should include(new_title)
  @tasks.collect {|t| t[:title]}.should_not include(old_title)
end

When(/^I mark the task as complete$/) do
  @task.complete!
end

Then(/^I should see "(.*?)" with a completed status$/) do |title|
  task = Task.where(:title=>title).first
  task.status.should=="completed"
end
