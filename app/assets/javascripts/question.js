$(document).ready(function(){
  $('.new-comment').on("click", function(event){
    event.preventDefault();
    var self = $(this)
    $.ajax({
      method: "get",
      url: $(this).attr("href"),
    })
    .done(function(data){
      if ($(self.parent().children('.new-comment-form').children()).length === 0) {
        $(self.parent().children('.new-comment-form')).append(data);
      };
    });

  });

  $('.new-answer-link').on("click", function(event){
    event.preventDefault();
    var self = $(this)
    $.ajax({
      method: "get",
      url: $(this).attr("href")
    })
    .done(function(data){

      if ($(self.parent().children()).length === 1) {
        $(self.parent().append(data));
      };
    });
  });


  $('.answer-sort-link').on("click", function(event) {
    event.preventDefault();

    var self= $(this);
    $.ajax({
      method: "get",
      url: $(this).attr("href")
    })
    .done(function(data){
      $(self.parent().parent().parent().children('.answer-display').html(data));
    });
  });
});
