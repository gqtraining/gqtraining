Given(/^that I have a list of tasks available$/) do |task_table|
  task_table.hashes.each do |task_attributes|
    Task.create task_attributes
  end
end
When(/^I create a new task "(.*?)"$/) do |title|
  visit '/'
  fill_in 'task-title',:with=>title
  find('input#task-title').native.send_key(:return)
end

Then(/^I should be able to see the "(.*?)" task$/) do |title|
  page.within("ul.tasks") do
    page.should have_content(title)
  end
end

Given(/^that I have a task "(.*?)"$/) do |title|
  @task = Task.create :title=>title
end

When(/^I edit the task to read "(.*?)"$/) do |title|
  #@task.update(:title=>title)
  visit '/'
  task_id = @task.attributes[:id]
  task_li= find("li.task#task-#{task_id}")
  within(task_li) do
    find('span').click
    fill_in 'title',:with=>title
    find('input').native.send_key(:return)
  end
  #click_on @task.title
end

Then(/^I should be able to see "(.*?)" instead of "(.*?)"$/) do |new_title, old_title|
  within('ul.tasks') do
    page.should_not have_content(old_title)
    page.should have_content(new_title)
  end
end

When(/^I mark the task as complete$/) do
  @task.complete!
end

Then(/^I should see "(.*?)" with a completed status$/) do |title|
  task = Task.where(:title=>title).first
  task.status.should=="completed"
end


Given(/^that I have a file called "(.*?)"$/) do |file_name|
  content="Task 1\nTask 2\nTask 3"
  @file_name="/tmp/cuke_#{file_name}"
  File.open(@file_name,'w') { |f| f.write content }
end

When(/^I upload the file$/) do
  visit '/'
  attach_file 'Upload file to import',@file_name
  click_on 'Upload'
end

Then(/^I should be able to see the new tasks specified in "(.*?)"$/) do |arg1|
  sleep 10
  within('ul.tasks') do
    page.should have_content('Task 1')
    page.should have_content('Task 2')
    page.should have_content('Task 3')
  end
end
