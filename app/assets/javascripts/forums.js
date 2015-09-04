$(document).on('ready page:load', function(e) {
  $('.ui.sticky')
    .sticky({
      context: '#bodyR',
      offset: 10
    })
  ;

  $

  $("button[id='link_markup']").click(function(e) {
    var current_msg = $('textarea').get(0).value;

    var link = prompt("Enter a valid URL: (must include http://):");

    if( link != null) {
      var title = prompt("Enter your link title:", "LINK");

      if( title === "") {
        title = "LINK";
      }

      new_msg = current_msg + "[url=" + link + "]" + title + "[/url]";

      $('textarea').get(0).value = new_msg;
    }
  })

  $("button[id='img_markup']").click(function(e) {
    var current_msg = $('textarea').get(0).value;

    var img_url = prompt("Enter a valid image URL: (must include http://):");

    if( img_url != null) {
      var img = "[img](url='" + img_url + "')[/img]";

      var new_msg = current_msg + img;

      $('textarea').get(0).value = new_msg;
    }
  })

  $("button[id='bold_markup']").click(function(e) {
    var current_msg = $('textarea').get(0).value;

    var bold = prompt("Enter the text you wish to bold:");

    if( bold != null) {
      var new_msg = current_msg + "[b]" + bold + "[/b]";

      $('textarea').get(0).value = new_msg;
    }
  })

  $("button[id='italicize_markup']").click(function(e) {
    var current_msg = $('textarea').get(0).value;

    var italicize = prompt("Enter the text you wish to italicize:");

    if( italicize != null) {
      var new_msg = current_msg + "[i]" + italicize + "[/i]";

      $('textarea').get(0).value = new_msg;
    }
  })

  $("button[id='underline_markup']").click(function(e) {
    var current_msg = $('textarea').get(0).value;

    var underline = prompt("Enter the text you wish to underline:");

    if( underline != null) {
      var new_msg = current_msg + "[u]" + underline + "[/u]"

      $('textarea').get(0).value = new_msg;
    }
  })

  $("button[id='quote_markup']").click(function(e) {
    var current_msg = $('textarea').get(0).value;

    var quote = prompt("Enter the text you wish to quote:");
  })

  function printProperties(object) {
    var property;

    for (property in object) {
      console.log("Name: " + property);
      console.log("Value: " + object[property]);
    }
  }


  $('#upArrow').click(function(e) {
    // disable button
    // ajax post
    var string = e.target.closest('tr').id;
    var re = /[0-9]+/;
    var id = re.exec(string)[0];
    var url = "/topics/posts/" + id + "/upvote";

    jQuery.ajax({
                url: url,
                type: "post",
                success: function() {
                  // console.log("success") 
                },
                complete: function() {
                  // console.log("complete");
                  // var upvote_number_string = $('span#upvote').html();
                  // var upvote_number_int = parseInt(upvote_number_string);
                }
    });
  });



  $('#downArrow').click(function(e) {

    var string = e.target.closest('tr').id;
    var re = /[0-9]+/;
    var id = re.exec(string)[0];
    var url = "/topics/posts/" + id + "/downvote";

    jQuery.ajax({
                url: url,
                type: "post",
                success: function(data) {
                  // console.log("success");
                  // console.log(data);
                },
                complete: function() {
                  // console.log("complete");
                }
    });
  });
});
