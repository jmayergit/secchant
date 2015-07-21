$(document).ready(function() {
  $('.ui.sticky')
    .sticky({
      context: '#bodyR',
      onStick: function() {
        console.log('Stuck!')
      },
      observeChanges: true
    })
  ;
  console.log('document ready!');
  $('.PgBoardName')
    .transition('pulse')
  ;
});
// $('.ui.sticky')
//   .sticky({
//     context: '#bodyR'
//   })
// ;
