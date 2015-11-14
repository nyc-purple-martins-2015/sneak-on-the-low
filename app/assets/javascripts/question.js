$(document).ready(function(){
  $('.new-comment').on("click", function(event){
    event.preventDefault();
    var self = $(this)
    $.ajax({
      method: "get",
      url: $(this).attr("href"),
    })
    .done(function(data){
      $(self.parent().children('.new-comment-form')).append(data);
    })

  });

  $('.new-answer-link').on("click", function(event){
    event.preventDefault();
    var self = $(this)
    $.ajax({
      method: "get",
      url: $(this).attr("href")
    })
    .done(function(data){
      $(self.parent().append(data));
    })
  });

});
