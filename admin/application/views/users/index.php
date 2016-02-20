            <div class="container-fluid">
                <div class="side-body">
                    <div class="page-title">
                        <span class="title">Admin</span>
                        <div class="description">Manage Admin user who can login and access this page</div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="panel fresh-color panel-info">
                                <div class="panel-heading">
                                    <h3>Registered Admin <button class="btn btn-primary pull-right" style="margin-top: -10px;" data-toggle="modal" data-target="#modalAddUser"><i class="fa fa-plus"></i></button></h3>

                                </div>
                                <div class="panel-body">
                                    <table class="datatable table table-striped" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th>No. </th>
                                                <th>ID</th>
                                                <th>Username</th>
                                                <th>Registered Date</th>
                                                <th>Last Login</th>
                                                <th>Role</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>No. </th>
                                                <th>ID</th>
                                                <th>Username</th>
                                                <th>Registered Date</th>
                                                <th>Last Login</th>
                                                <th>Role</th>
                                                <th></th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <?php
                                                $i = 0;
                                                foreach($table->result() as $row){
                                                    if($row->deleted_at == NULL){
                                                        $i++;
                                                    echo '<tr>
                                                            <td>'. $i.'</td>
                                                            <td>'. $row->id .'</td>
                                                            <td>'. $row->username .'</td>
                                                            <td>'. $row->created_at .'</td>
                                                            <td>'. $row->last_login .'</td>
                                                            <td>';

                                                     $var = $row->previllage;
                                                    if($var == 1){
                                                        echo 'General Admin</td>
                                                            <td><button class="btn btn-danger btn-xs pull-right" onClick="deleteUser(\''. $row->id . '\')">
                                                                    <i class="fa fa-trash"></i>
                                                                </button></td>
                                                         </tr>';
                                                    }
                                                    
                                                    elseif($row->previllage==2){
                                                        echo 'Blog Admin</td>
                                                            <td><button class="btn btn-danger btn-xs pull-right" onClick="deleteUser(\''. $row->id . '\')">
                                                                    <i class="fa fa-trash"></i>
                                                                </button></td>
                                                         </tr>';
                                                    }
                                                    elseif($row->previllage==3){
                                                        echo 'Approval Action Admin</td>
                                                            <td><button class="btn btn-danger btn-xs pull-right" onClick="deleteUser(\''. $row->id . '\')">
                                                                    <i class="fa fa-trash"></i>
                                                                </button></td>
                                                         </tr>';
                                                    }
                                                            
                                                    }
                                                    
                                                }
                                            ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                    <div class="modal fade modal-primary" id="modalAddUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">Add User</h4>
                                </div>
                                <form id="addUserForm">
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label for="username">Username*</label>
                                        <input type="text" name="username" class="form-control" id="username" placeholder="Username :" required="required">
                                        <p id="usernamealert" style="dislay: none; color: red;"></p>
                                    </div>
                                    <div class="form-group">
                                        <label for="password">Password*</label>
                                        <input type="password" name="password" class="form-control" id="password" placeholder="Password :" required="required">
                                        <p id="passwordalert" style="dislay: none; color: red;"></p>
                                    </div>
                                    <div class="form-group">
                                        <label for="confpassword">Confirm Password*</label>
                                        <input type="password" name="confpassword" class="form-control" id="confpassword" placeholder="Confirm Password :" required="required">
                                        <p id="confpasswordalert" style="dislay: none; color: red;"></p>
                                    </div>
                                    <div class="form-group">
                                        <div>
                                        <label>Role*</label><br>
                                          <div class="radio3 radio-check radio-inline">
                                            <input type="radio" id="role1" name="role" value="Writer" checked="">
                                            <label for="role1">
                                              General Admin
                                            </label>
                                          </div>
                                          <div class="radio3 radio-check radio-inline">
                                            <input type="radio" id="role2" name="role" value="Translator">
                                            <label for="role2">
                                              Blog Admin
                                            </label>
                                          </div>
                                          <div class="radio3 radio-check radio-danger radio-inline">
                                            <input type="radio" id="role3" name="role" value="Administrator">
                                            <label for="role3">
                                              Approval Action Admin
                                            </label>
                                          </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <input type="submit" id="submitButton" class="btn btn-info" value="Submit">
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>


