<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->library('session');
        if($this->session->userdata('finadmin') == 'yesiam'){
            redirect(base_url());
        }
    }

	public function index()
	{
        $this->load->view('login/index');
	}

    public function doLogin(){
        if($this->input->is_ajax_request()){
            $username = $this->input->post('username');
            $password = $this->input->post('password');

            $this->load->model('usermodel');
            $user = $this->usermodel->getUserByUsername($username);
            if($user->num_rows() == 1){
                foreach ($user->result() as $row){
                    if($this->verify($password, $row->salt_user, $row->password_user)){

                        $this->session->set_userdata('iduser_ppkk', $row->id_user);
                        $this->session->set_userdata('username_ppkk', $row->username_user);
                        $this->session->set_userdata('role_ppkk', $row->role_user);
                        $this->session->set_userdata('finadmin', 'yesiam');

                        $date = date("Y:m:d H:i:s");
                        $this->usermodel->updateLastLogin($row->id_user, $date);

                        echo json_encode(array('st' => 1, 'msg' => 'Done'));
                    } else {
                        echo json_encode(array('st' => 0, 'msg' => 'Username and password combination is not available'));
                    }
                }
            } else {
                echo json_encode(array('st' => 0, 'msg' => 'Username is not available'));
            }
        } else {
            show_error('This page content is forbidden');
        }

    }

    private function verify($plain, $salt, $chiper){
        return (crypt($plain, $salt) === $chiper);
    }
}
