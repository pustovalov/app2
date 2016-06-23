// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require bootstrap.min

$(function() {
  function searchImg() {
    var photosContainer = $(".js-photos"),
        url = $(".js-find-img").data("url");

    $.ajax({
      url: url,
      type: "GET",
      data: { request: $(".js-flick-field").val() }
    })
    .success(function(data) {
      photosContainer.empty();

      $.each(data.photos, function(i,item){
          var src = "http://farm" + item.farm + ".static.flickr.com/" + item.server + "/" + item.id + "_" + item.secret + ".jpg";
          var img =  $("<a href='#' class='thumbnail js-img' />").append($("<img/>").attr({ "src": src }));
          var li = $("<li />").append(img);

          li.appendTo(photosContainer);
      });
    })
    .fail(function() {
      photosContainer.html("#{t(:try_again)}");
    });
  }

  $(".js-flickr-search")
    .on("click", function(e) {
      e.preventDefault();
      searchImg();
    });

  $(".js-flick-field")
    .on("keypress", function(e) {
     if (e.which === 13) {
       e.preventDefault();
       searchImg();
     }
    });

  $(document).on("click", ".js-img", function(e) {
    e.preventDefault();
    $(".js-img").removeClass("active");

    $(this).addClass("active");
    $(".js-remote-url").val( $(this).find("img").attr("src") );
  });
});
