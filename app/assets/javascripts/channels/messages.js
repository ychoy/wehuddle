App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    $("#messages").removeClass('hidden')
    return $('#messages').append(this.renderMessage(data));
  },

  renderMessage: function(data) {
    return `<div class="event">
	<div class="label"><img src="${data.avatar}" /></div>
	<div class="content">
		<div class="summary">
			<div class="user">${data.user}</div>
			<div class="date">${jQuery.timeago(data.created_at)} ago</div>
		</div>
		<div class="extra text">${data.message}</div>
	</div>
</div>`;
  }
});

