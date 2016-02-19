<html lang="ina">
<head>
    <?php
        function base_url(){
            return 'http://localhost/ppkkweb/';
        }
    ?>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Error Page | PPKK</title>
    <link href="<?php echo base_url(); ?>public/css/bootstrap.min.css" rel="stylesheet">
    <link href="<?php echo base_url(); ?>public/css/font-awesome.min.css" rel="stylesheet">
    <link href="<?php echo base_url(); ?>public/css/animate.min.css" rel="stylesheet">
    <link href="<?php echo base_url(); ?>public/css/lightbox.css" rel="stylesheet">
	<link href="<?php echo base_url(); ?>public/css/main.css" rel="stylesheet">
	<link href="<?php echo base_url(); ?>public/css/responsive.css" rel="stylesheet">

    <!--[if lt IE 9]>
	    <script src="js/html5shiv.js"></script>
	    <script src="js/respond.min.js"></script>
    <![endif]-->
    <link rel="shortcut icon" href="<?php echo base_url(); ?>public/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<?php echo base_url(); ?>public/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<?php echo base_url(); ?>public/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<?php echo base_url(); ?>public/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="<?php echo base_url(); ?>public/images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>
    <section id="error-page">
        <div class="error-page-inner">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="text-center">
                            <div class="bg-404">
                                <div class="error-image">
                                    <img class="img-responsive" src="<?php echo base_url(); ?>public/images/404.png" alt="">
                                </div>
                            </div>
                            <h2><?php echo $heading; ?></h2>
                            <p><?php echo $message; ?></p>
                            <a href="<?php echo base_url(); ?>" class="btn btn-error">RETURN TO THE HOMEPAGE</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <script type="text/javascript" src="<?php echo base_url(); ?>public/js/jquery.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>public/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>public/js/jquery.isotope.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>public/js/lightbox.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>public/js/wow.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>public/js/main.js"></script>
</body>
</html>
