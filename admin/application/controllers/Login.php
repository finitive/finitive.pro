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

            $this->load->model('adminmodel');
            $admin = $this->adminmodel->getAdminByUsername($username);
            if($admin->num_rows() == 1){
                foreach ($admin->result() as $row){
                    if($this->verify($password, $row->salt, $row->password)){

                        $this->session->set_userdata('id', $row->id);
                        $this->session->set_userdata('username', $row->username);
                        $this->session->set_userdata('role', 'General Admin');
                        $this->session->set_userdata('coderole', $row->previllage);
                        $this->session->set_userdata('finadmin', 'yesiam');

                        // $date = date("Y:m:d H:i:s");
                        // $this->adminmodel->updateLastLogin($row->id, $date);

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
