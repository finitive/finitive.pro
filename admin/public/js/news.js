$(document).ready(function () {
    $("#addNewsForm").submit(function (e) {
        e.preventDefault();
		var content = $('#txtEditor').Editor('getText');
		var url = $('#url').attr('href') + 'news/add';
		$('#rawContent').val(content);
        $('#submitButton').attr('disabled', true);
        var formData = new FormData($("#addNewsForm")[0]);
        $.ajax({
            url: url,
            type: 'post',
            data: formData,
            cache: false,
            contentType: false,
            processData: false,
            dataType: 'json',
        }).done(function (data) {
			if(data.st == 1){
				window.location.replace($('#url').attr('href') + 'news');
			} else if(data.st == 2){
                $('#imgalert').html(data.msg);
                $('#imgalert').show('fast');
			} else {
                $('#titlealert').html(data.msg.title_alert);
                $('#titlealert').show('fast');
                $('#contentalert').html(data.msg.content_alert);
                $('#contentalert').show('fast');
			}
        });
    });
});

function deleteNews(id) {
    var accept = confirm("You're about to delete this item");
    if (accept) {
        var url = $('#url').attr('href') + "news/delete";
        var post_data = {
            'target': id,
            '<?php echo $this->security->get_csrf_token_name(); ?>': '<?php echo $this->security->get_csrf_hash(); ?>'
        };
        $.ajax({
            url: url,
            type: 'POST',
            data: post_data,
            success: function (data) {
                if(data == 1){
                    alert('Deleted successfully');
                    window.location.replace($('#url').attr('href') + 'news');
                } else {
                    alert('Delete failed');
                }
            }
        });
    } else {

    }
}
