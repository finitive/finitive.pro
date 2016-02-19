$(document).ready(function () {
    $("#addEventForm").submit(function (e) {
        e.preventDefault();
        $('#submitButton').attr('disabled', true);
        var formData = new FormData($("#addEventForm")[0]);
        var url = $('#url').attr('href') + 'event/add';

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
                $('#titlealert').html(data.msg.title_alert);
                $('#titlealert').show('fast');
                $('#descalert').html(data.msg.desc_alert);
                $('#descalert').show('fast');
				$('#datealert').html(data.msg.date_alert);
                $('#datealert').show('fast');
				$('#locationalert').html(data.msg.location_alert);
                $('#locationalert').show('fast');
				$('#ticketalert').html(data.msg.ticket_alert);
                $('#ticketalert').show('fast');
                $('#submitButton').attr('disabled', false);
            } else if(data.st == 2) {
                $('#imgalert').html(data.msg);
                $('#imgalert').show('fast');
                $('#submitButton').attr('disabled', false);
            } else {
                window.location.replace($('#url').attr('href') + 'event');
            }
        });
    });
    $("#updateEventForm").submit(function (e) {
        e.preventDefault();
        $('#updateButton').attr('disabled', true);
        var formData = new FormData($("#updateEventForm")[0]);
        var url = $('#url').attr('href') + 'event/update';
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
                $("#newtitlealert").html(data.msg.newtitle_alert);
				$("#newtitlealert").show('fast');
				$("#newdescalert").html(data.msg.newdesc_alert);
				$("#newdescalert").show('fast');
                $("#newdatealert").html(data.msg.newdate_alert);
				$("#newdatealert").show('fast');
				$("#newlocationalert").html(data.msg.newlocation_alert);
				$("#newlocationalert").show('fast');
				$("#newticketalert").html(data.msg.newticket_alert);
				$("#newticketalert").show('fast');

				$("#newimgalert").hide('fast');
                $('#updateButton').attr('disabled', false);
            } else if (data.st == 2) {
				$("#newimgalert").val(data.msg);
				$("#newimgalert").show('fast');

				$("#newtitlealert").hide('fast');
				$("#newdescalert").hide('fast');
				$("#newdatealert").hide('fast');
				$("#newticketalert").hide('fast');
				$("#newlocationalert").hide('fast');
				$('#updateButton').attr('disabled', false);
				window.location.replace($('#url').attr('href') + 'event');
			} else {
                window.location.replace($('#url').attr('href') + 'event');
            }
        });
    });
	$("#updateEventEng").submit(function (e) {
        e.preventDefault();
        $('#updateEngButton').attr('disabled', true);
        var formData = new FormData($("#updateEventEng")[0]);
        var url = $('#url').attr('href') + 'event/updateEnglishContent';
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
                $("#engdescalert").html(data.msg.engdesc_alert);
				$("#engdescalert").show('fast');

                $('#updateButton').attr('disabled', false);
            }  else {
                window.location.replace($('#url').attr('href') + 'event');
            }
        });
    });
});

function deleteEvent(id) {
    var accept = confirm("You're about to delete this item");
    if (accept) {
        var url = $('#url').attr('href') + "event/delete";
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
                    window.location.replace($('#url').attr('href') + 'event');
                } else {
                    alert('Delete failed');
                }
            }
        });
    } else {

    }
}

function updateEvent(id) {
    var url = $('#url').attr('href') + "event/get";

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
                $("#target").val(v.id_event);
				$("#oriimg").val(v.img_event);
                $("#newtitle").val(v.title_event);
				$("#newdesc").val(v.desc_event);
                $("#newdate").val(v.date_event);
				$("#newlocation").val(v.location_event);
				$("#newticket").val(v.ticket_event);
				$("#newblah").attr('src', '../public/images/event/' + v.img_event);
                $('#modalUpdateEvent').modal('show');
            });
        }
    });
}

function updateEnglishContent(id) {
    var url = $('#url').attr('href') + "event/get";

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
                $("#targetEng").val(v.id_event);
				$("#engdesc").val(v.desceng_event);
				$("#inddesc").val(v.desc_event);
                $('#modalUpdateEng').modal('show');
            });
        }
    });
}
