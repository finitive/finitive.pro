$(document).ready(function () {
    $("#addUserForm").submit(function (e) {
        e.preventDefault();
        $('#submitButton').attr('disabled', true);
        var formData = new FormData($("#addUserForm")[0]);
        var url = $('#url').attr('href') + 'users/add';

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
            if (data.st == 0){
                $('#usernamealert').html(data.msg.username_alert);
                $('#usernamealert').show('fast');
                $('#passwordalert').html(data.msg.password_alert);
                $('#passwordalert').show('fast');
                $('#confpasswordalert').html(data.msg.confpassword_alert);
                $('#confpasswordalert').show('fast');
                $('#roleealert').html(data.msg.role_alert);
                $('#rolealert').show('fast');
                $('#submitButton').attr('disabled', false);
            } else {
                window.location.replace($('#url').attr('href') + 'users');
            }

            alert(data.st);
        });
    });

    $("#changePassForm").submit(function (e) {
        e.preventDefault();
        $('#changeButton').attr('disabled', true);
        var formData = new FormData($("#changePassForm")[0]);
        var url = $('#url').attr('href') + 'users/changePassword';
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
            if (data.st == 0){
                $('#oldpasswordalert').html(data.msg.oldpassword_alert);
                $('#oldpasswordalert').show('fast');
                $('#newpasswordalert').html(data.msg.newpassword_alert);
                $('#newpasswordalert').show('fast');
                $('#confnewpasswordalert').html(data.msg.confnewpassword_alert);
                $('#confnewpasswordalert').show('fast');
			    $('#oldpasswordalert').hide('fast');
                $('#changeButton').attr('disabled', false);
            } else if (data.st == 2) {
                $('#oldpasswordalert').html(data.msg);
                $('#oldpasswordalert').show('fast');
				$('#confnewpasswordalert').hide('fast');
                $('#newpasswordalert').hide('fast');
                $('#changeButton').attr('disabled', false);
            } else {
                $('#confnewpasswordalert').hide('fast');
                $('#newpasswordalert').hide('fast');
                $('#oldpasswordalert').hide('fast');
                $('#changePassForm')[0].reset();
                $('#successPass').show('fast');
                $('#successPass').delay('5000').hide('fast');
				$('#changeButton').attr('disabled', false);
            }
        });
    });

    $('#logoutButton').click(function(){
        var url = $('#url').attr('href') + 'home/doLogout';
        $.ajax({
            url: url
        }).done(function (data) {
            if (data == "1"){
                window.location.replace($('#url').attr('href'));
            } else {
                alert('Failed to log out')
            }
        });
    });
});

function deleteUser(id) {
    var accept = confirm("You're about to delete this item");
    if (accept) {
        var url = $('#url').attr('href') + "users/delete";
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
                    window.location.replace($('#url').attr('href') + 'users');
                } else {
                    alert('Delete failed');
                }
            }
        });
    } else {

    }
}
