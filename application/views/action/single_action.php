                        <div class="grid_3">
                            <div class="project-short sml-thumb">
                                <div class="top-project-info">
                                    <div class="content-info-short clearfix">
                                        <a href="#" class="thumb-img">
                                            <img src="<?php echo base_url(); ?>public/images/ex/<?php echo $data->url_photo1 ;?>" alt="$TITLE">
                                        </a>
                                        <div class="wrap-short-detail">
                                            <h3 class="rs acticle-title"><a class="be-fc-orange" href="#"><?php echo $data->title; ?></a></h3>
                                            <p class="rs tiny-desc">by <a href="#" class="fw-b fc-gray be-fc-orange"> <?php echo $data->name;?></a></p>
                                            <p class="rs title-description"><?php echo $data->tag_line ;?></p>
                                            <p class="rs project-location">
                                                <i class="icon iLocation"></i>
                                                <?php echo $data->city;?>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="bottom-project-info clearfix">
                                    <div class="line-progress">
                                        <div class="bg-progress">
                                            <span  style="width: 50%"></span>
                                        </div>
                                    </div>
                                    <div class="group-fee clearfix">
                                        <div class="fee-item">
                                            <p class="rs lbl">Funded</p>
                                            <span class="val">50%</span>
                                        </div>
                                        <div class="sep"></div>
                                        <div class="fee-item">
                                            <p class="rs lbl">Pledged</p>
                                            <span class="val">RP <?php echo $data->goal_founding ;?></span>
                                        </div>
                                        <div class="sep"></div>
                                        <div class="fee-item">
                                            <p class="rs lbl">Days Left</p>
                                            <span class="val">25</span>
                                        </div>
                                    </div>
                                    <div class="clear"></div>
                                </div>
                            </div>
                        
                        </div><!--end: .grid_3 > .project-short-->
                        