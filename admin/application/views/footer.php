            <div class="modal fade modal-primary" id="modalChangePassword" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Change Password</h4>
                        </div>
                        <form id="changePassForm">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="oldpassword">Old Password*</label>
                                <input type="password" name="oldpassword" class="form-control" id="oldpassword" placeholder="Old Password :" required="required">
                                <p id="oldpasswordalert" style="dislay: none; color: red;"></p>
                            </div>
                            <div class="form-group">
                                <label for="newpassword">New Password*</label>
                                <input type="password" name="newpassword" class="form-control" id="newpassword" placeholder="New Password :" required="required">
                                <p id="newpasswordalert" style="dislay: none; color: red;"></p>
                            </div>
                            <div class="form-group">
                                <label for="confnewpassword">Confirm Password*</label>
                                <input type="password" name="confnewpassword" class="form-control" id="confnewpassword" placeholder="Confirm New Password :" required="required">
                                <p id="confnewpasswordalert" style="dislay: none; color: red;"></p>
                            </div>
                        </div>
                        <div class="alert alert-success" role="alert" style="display: none;" id="successPass">
                            <strong>Well done!</strong> Password changed successfully.
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <input type="submit" id="changeButton" class="btn btn-info" value="Submit">
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <footer class="app-footer">
            <div class="wrapper">
                <span class="pull-right">2.1 <a href="#"><i class="fa fa-long-arrow-up"></i></a></span> © 2015 Copyright.
            </div>
        </footer>
        </body>
</html>
