;(function($){
  var loadTasks=function(){
    $.get("/tasks").then(function(tasks){
      $("ul.tasks").html("")
      $("input#task-title").val("");
      _.each(tasks, function(t) {
        var taskHtml = _.template($("#task-template").html())({task: t});
        var li =$("<li class='task' id='task-"+t.id+"'></li>").data('task',t).append(taskHtml)
        $("ul.tasks").append(li)
      });
    });
  }

  $(function(){
    // load tasks
    loadTasks();
    //handle form
    $("form#task-form").submit(function(){
      var title = $("input#task-title").val();
      $.post("/tasks",{title: title}).then(loadTasks);
      return false;
    });
    $('body').on('click','li.task span.title',function(){
      var $taskElem=$(this);
      var taskId = $taskElem.data('taskId');
      var editTaskHtml = _.template($("#task-edit-template").html())({content: $taskElem.html().trim(),task_id: taskId});
      $($taskElem.parent()).html(editTaskHtml);
    });
    $('body').on('submit','form.task-edit-form',function(){
      var $form = $(this);
      var newTitle = $form.find('input').val();
      $.post($form.data('url'),{title: newTitle.trim()}).then(loadTasks);
      return false;
    })
  });
})(jQuery);
