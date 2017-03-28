$(document).ready(function() {
  submitNewMessage();
});

function submitNewMessage(){
  $('textarea#message_content').keydown(function(event) {
  	debugger
    if (event.keyCode == 13) {
        $('[data-send="message"]').click();
        $('[data-textarea="message"]').val(" ")
        return false;
     }
  });
}
