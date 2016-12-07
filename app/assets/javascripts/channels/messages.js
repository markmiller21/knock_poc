$(document).ready(function() {
    App.messages = App.cable.subscriptions.create({
        channel: 'MessagesChannel',
        current_user_id: $('#chat-dialog').data('me'),
        target_user_id: $("#chat-dialog").data('target')
    }, {
        connected: function() {
            this.install();
        },

        disconnected: function() {

        },

        received: function(data) {
            $("#message-list").append(data);
            var objDiv = document.getElementById("message-list");
            objDiv.scrollTop = objDiv.scrollHeight;
        },

        appear: function(){
            //this.perform("receive", {
            //    data: "yu song"
            //});
        },

        renderMessage: function(data) {
            return '<p> <b>' + data.user + ': </b>' + data.message + '</p>';
        },

        install: function(){
            $("#send-btn").on("click", (function(_this) {
                return function() {
                    //_this.appear();
                    return false;
                };
            })(this));
        }
    });
});