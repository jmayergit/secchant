// $(document).ready(function() {
//   $('.ui.sticky')
//     .sticky({
//       context: '#bodyR',
//       onStick: function() {
//         console.log('Stuck!')
//       },
//       observeChanges: true
//     })
//   ;
//   $('.PgBoardName')
//     .transition('pulse')
//   ;
// });
// $('.ui.sticky')
//   .sticky({
//     context: '#bodyR'
//   })
// ;
$(document).on('ready page:load', function(e) {
  $('.ui.sticky')
    .sticky({
      context: '#bodyR',
      offset: 10
    })
  ;
});
