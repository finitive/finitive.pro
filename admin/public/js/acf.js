$(document).ready(function () {
    $("#participants").keyup(function (e) {
        var length = $("#participants").val().length;
        if (e.which == 13 && length == 20) {
            var url = $('#url').attr('href') + "careerfair/get";
            var value = $('#participants').val();
            var post_data = {
                'target': value,
                '<?php echo $this->security->get_csrf_token_name(); ?>': '<?php echo $this->security->get_csrf_hash(); ?>'
            };
            $.ajax({
                url: url,
                type: 'POST',
                data: post_data,
                dataType: 'json',
                success: function (data) {
                    if (data == ""){
                        alert("ID Not Found");
                        $("#name").html('');
                        $("#email").html('');
                        $("#phone").html('');
                        $("#address").html('');
                        $("#education").html('');
                        $("#university").html('');
                        $("#gpa").html('');
                        $("#presence").attr('disabled', true);
                    }
                    $.each(data, function (k, v) {
                        $("#name").html(v.name_jobseeker);
                        $("#email").html(v.email_jobseeker);
                        $("#phone").html(v.phone_jobseeker);
                        $("#address").html(v.address_jobseeker);
                        $("#education").html(v.education_jobseeker);
                        $("#university").html(v.university_jobseeker);
                        $("#gpa").html(v.gpa_jobseeker);
                        $("#presence").attr('disabled', false);
                    });
                }
            });
        } else {
            $("#name").html('');
            $("#email").html('');
            $("#phone").html('');
            $("#address").html('');
            $("#education").html('');
            $("#university").html('');
            $("#gpa").html('');
            $("#presence").attr('disabled', true);
        }
    });

    $('#presence').click(function() {
        var url = $('#url').attr('href') + "careerfair/presencesign";
        var value = $('#participants').val();
        var post_data = {
            'target': value,
            '<?php echo $this->security->get_csrf_token_name(); ?>': '<?php echo $this->security->get_csrf_hash(); ?>'
        };
        $.ajax({
            url: url,
            type: 'POST',
            data: post_data,
            success: function (data) {
                alert(data);
            }
        });

    });
});
