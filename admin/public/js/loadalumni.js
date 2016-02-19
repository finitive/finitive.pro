$(document).on('click', '#table_alumni tr', function (e) {
    e.stopPropagation();
    var $this = $(this);
    var trid = $this.closest('tr').data('id');
    // alert("TR ID " + trid);
    var url = $('#url').attr('href') + 'alumni/getdetail';
    
    var post_data = {
        'target': trid,
        '<?php echo $this->security->get_csrf_token_name(); ?>': '<?php echo $this->security->get_csrf_hash(); ?>'
        
    };
    
    $.ajax({
        url: url,
        type: 'POST',
        data: post_data,
        dataType: 'json',
        success: function (data) {
            $.each(data, function (k, v) {
                document.getElementById("name_alumni").innerHTML = v.name_alumni;
                document.getElementById("faculty").innerHTML = v.faculty_alumni;
                document.getElementById("phone").innerHTML = v.phone_alumni;
                document.getElementById("email").innerHTML = v.email_alumni;
                document.getElementById("borndate").innerHTML = v.borndate_alumni;
                document.getElementById("companyname").innerHTML = v.companyname_alumni;
                document.getElementById("sectorcountry").innerHTML = v.companysector_alumni+", "+v.companycountry_alumni;                
                document.getElementById("position").innerHTML = v.position_alumni;
                document.getElementById("companyphone").innerHTML = v.companyphone_alumni;
                document.getElementById("companymail").innerHTML = v.companyemail_alumni;


                if (v.verified_alumni == "1") {
                    var statusemail = "Email sudah terverifikasi";
                }
                else{
                    var statusemail = "Email belum terverifikasi";
                }


                document.getElementById("statusemail").innerHTML = statusemail;


                $('#modalDetailAlumni').modal('show');
            });
        }
    });

});

