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

    var img = prompt("Enter a valid image URL: (must include http://):");
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


  $('.editComment').click(function(e) {
    console.log("Edit Comment Btn Clicked");
  })
});
