$(document).ready(function () {
    $("#addGalleryForm").submit(function (e) {
        e.preventDefault();
        $('#submitButton').attr('disabled', true);
        var formData = new FormData($("#addGalleryForm")[0]);
        var url = $('#url').attr('href') + 'gallery/add';

        $.ajax({
            url: url,
            type: 'post',
            data: formData,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            dataType: 'json',
        }).done(function (data) {
            if(data.st == 0){
                $('#captionalert').html(data.msg.caption_alert);
                $('#captionalert').show('fast');
                $('#engcaptionalert').html(data.msg.engcaption_alert);
                $('#engcaptionalert').show('fast');
                $('#submitButton').attr('disabled', false);
            } else if(data.st == 2) {
                $('#imgalert').html(data.msg);
                $('#imgalert').show('fast');

				$('#captionalert').hide('fast');
				$('#engcaptionalert').hide('fast');
                $('#submitButton').attr('disabled', false);
            } else {
                window.location.replace($('#url').attr('href') + 'gallery');
            }
        });
    });
    $("#updateGalleryForm").submit(function (e) {
        e.preventDefault();
        $('#updateButton').attr('disabled', true);
        var formData = new FormData($("#updateGalleryForm")[0]);
        var url = $('#url').attr('href') + 'gallery/update';
        $.ajax({
            url: url,
            type: 'post',
            data: formData,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            dataType: 'json',
        }).done(function (data) {
            if(data.st == 0){
                $('#newcaptionalert').html(data.msg.newcaption_alert);
                $('#newcaptionalert').show('fast');
                $('#newengcaptionalert').html(data.msg.newengcaption_alert);
                $('#newengcaptionalert').show('fast');
                $('#updateButton').attr('disabled', false);
            } else {
                window.location.replace($('#url').attr('href') + 'gallery');
            }
        });
    });
});

function deleteGallery(id) {
    var accept = confirm("You're about to delete this item");
    if (accept) {
        var url = $('#url').attr('href') + "gallery/delete";
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
                    window.location.replace($('#url').attr('href') + 'gallery');
                } else {
                    alert('Delete failed');
                }
            }
        });
    } else {

    }
}

function updateGallery(id) {
    var url = $('#url').attr('href') + "gallery/get";
    var post_data = {
        'target': id,
        '<?php echo $this->security->get_csrf_token_name(); ?>': '<?php echo $this->security->get_csrf_hash(); ?>'
    };
    $.ajax({
        url: url,
        type: 'POST',
        data: post_data,
        dataType: 'json',
        success: function (data) {
            $.each(data, function (k, v) {
                $("#target").val(v.id_gallery);
                $("#newcaption").val(v.caption_gallery);
                $("#newcaptionEng").val(v.captioneng_gallery);
                $('#modalUpdateGallery').modal('show');
            });
        }
    });
}
