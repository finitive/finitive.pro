<!DOCTYPE html>
<html>

<head>
    <title><?php echo $title ?> Finitive Admin Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:300,400' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'>

    <!-- CSS Libs -->
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>public/dist/lib/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>public/dist/lib/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>public/dist/lib/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>public/dist/lib/css/bootstrap-switch.min.css">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>public/dist/lib/css/checkbox3.min.css">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>public/dist/lib/css/jquery.datatables.min.css">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>public/dist/lib/css/datatables.bootstrap.css">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>public/dist/lib/css/editor.css">

    <!-- CSS App -->
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>public/css/style.css">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>public/css/themes/flat-blue.css">

    <!-- JS -->
    <script type="text/javascript" src="<?php echo base_url(); ?>public/dist/lib/js/jquery.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>public/dist/lib/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>public/dist/lib/js/chart.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>public/dist/lib/js/bootstrap-switch.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>public/dist/lib/js/jquery.matchheight-min.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>public/dist/lib/js/jquery.datatables.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>public/dist/lib/js/datatables.bootstrap.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>public/dist/lib/js/select2.full.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>public/dist/lib/js/editor.js"></script>
    <script>
        $(document).ready(function() {
            $("#txtEditor").Editor({"insert_img":false, "fonts":false});
        });
    </script>
    <script type="text/javascript" src="<?php echo base_url(); ?>public/dist/lib/js/jquery.inputmask.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>public/dist/lib/js/jquery.inputmask.date.extensions.js"></script>
    <script>
        $(function () {
            $("[data-mask]").inputmask();
        });
    </script>
    <script type="text/javascript" src="<?php echo base_url(); ?>public/dist/lib/js/ace/ace.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>public/dist/lib/js/ace/mode-html.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>public/dist/lib/js/ace/theme-github.js"></script>

    <script type="text/javascript" src="<?php echo base_url(); ?>public/js/news.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>public/js/acf.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>public/js/loadalumni.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>public/js/admin.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>public/js/gallery.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>public/js/event.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>public/js/app.js"></script>
    <script type="text/javascript" src="<?php echo base_url(); ?>public/js/index.js"></script>

</head>
<a id="land" href="<?php echo base_url(); ?>" ></a>
<body class="flat-blue">
    <div class="app-container">
        <div class="row content-container">
            <nav class="navbar navbar-inverse navbar-fixed-top navbar-top">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-expand-toggle">
                            <i class="fa fa-bars icon"></i>
                        </button>
                        <button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
                            <i class="fa fa-th icon"></i>
                        </button>
                    </div>
                    <ul class="nav navbar-nav navbar-right">
                        <button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
                            <i class="fa fa-times icon" style="color: #fff"></i>
                        </button>
                        <li class="dropdown profile">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><?php echo $this->session->userdata('username'); ?> <span class="caret"></span></a>
                            <ul class="dropdown-menu animated fadeInDown">
                                <li>
                                    <div class="profile-info">
                                        <h4 class="username"><?php echo $this->session->userdata('username'); ?></h4>
                                        <h4><?php  echo $this->session->userdata('role'); ?></h4>
                                        <p>User ID : <?php  echo $this->session->userdata('id'); ?></p>
                                        <p>IP : <?php echo $this->input->ip_address(); ?></p>
                                        <p>Agent : <?php echo $this->input->user_agent(); ?></p>
                                        <div class="btn-group margin-bottom-2x" role="group">
                                            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modalChangePassword"><i class="fa fa-user"></i> Change Password</button>
                                            <button type="button" id="logoutButton" class="btn btn-default"><i class="fa fa-sign-out"></i> Logout</button>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
            <div class="side-menu sidebar-inverse">
                <nav class="navbar navbar-default" role="navigation">
                    <div class="side-menu-container">
                        <div class="navbar-header">
                            <a class="navbar-brand" href="<?php echo base_url(); ?>" id="url">
                                <div class="icon fa fa-wrench"></div>
                                <div class="title">Finitive Administration</div>
                            </a>
                            <button type="button" class="navbar-expand-toggle pull-right visible-xs">
                                <i class="fa fa-times icon"></i>
                            </button>
                        </div>
                        <ul class="nav navbar-nav">
                            <li <?php if ($title == "Home") echo'class="active"'; ?>>
                                <a href="<?php echo base_url(); ?>">
                                    <span class="icon fa fa-tachometer"></span><span class="title">Dashboard</span>
                                </a>
                            </li>
                            <li <?php if ($title == "Users") echo'class="active"'; ?>>
                                <a href="<?php echo base_url(); ?>users">
                                    <span class="icon fa fa-users"></span><span class="title">Admin Directory</span>
                                </a>
                            </li>
                            <li <?php if ($title == "Alumni") echo'class="active"'; ?>>
                                <a href="<?php echo base_url(); ?>">
                                    <span class="icon fa fa-user"></span><span class="title">Personalization</span>
                                </a>
                            </li>
                            <li class="panel panel-default dropdown <?php if ($title == "Article") echo 'active'; ?>">
                                <a data-toggle="collapse" href="#dropdown-element">
                                    <span class="icon fa fa-diamond"></span><span class="title">Actions</span>
                                </a>
                                <!-- Dropdown level 1 -->
                                <div id="dropdown-element" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul class="nav navbar-nav">
                                            <li><a href="<?php echo base_url(); ?>">Approval</a>
                                            </li>
                                            <li><a href="<?php echo base_url(); ?>">Rejected</a>
                                            </li>
                                            <li><a href="<?php echo base_url(); ?>">Publish</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            
                            <li>
                                <a href="#">
                                    <span class="icon fa fa-file-text-o"></span><span class="title">Blog</span>
                                </a>
                            </li>
                            
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->
                </nav>
            </div>
