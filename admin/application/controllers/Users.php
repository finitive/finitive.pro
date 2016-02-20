<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Users extends CI_Controller {

//funtion contruct untuk mengidentifikasi analisa sebelum masuk ke function index. 
//di sini di filter sessionnya apakah sudah melakukan login atau belum. 
//bila sudah pernah login dan belum logout atau belum d destroy cache nya maka di redirect di base url, 
//yaitu finitive.pro/admin/Home

    public function __construct(){
        parent::__construct();
        $this->load->library('session');
        if(!$this->session->userdata('finadmin') == 'yesiam'){
            redirect(base_url().'login');
        }
    }


//index dari controller ini adalah untuk mengambil tabel user admin yang ada di database dan data tabel 
//admins tersebut dikirim ke view view/user/index untuk di tampilkan datanya di view

	public function index()
	{
        $this->load->model('adminmodel');
        $user = $this->adminmodel->getAdminList();
        $header['title'] = 'Users';
        $content = array(
            'table' => $user
        );
		$this->load->view('header', $header);
        $this->load->view('users/index', $content);
        $this->load->view('footer');
	}

//function untuk add admin baru dengan tingkatan admin
    public function add(){
        if ($this->input->is_ajax_request()){
            $this->load->library('form_validation');

            $this->form_validation->set_rules('username', 'Username', 'required|alpha_numeric|min_length[5]|max_length[20]|is_unique[admins.username]');
            $this->form_validation->set_rules('password', 'Password', 'required|min_length[8]');
            $this->form_validation->set_rules('confpassword', 'Confirm Password', 'required|matches[password]');
            $this->form_validation->set_rules('role', 'Role', 'required');

            if ($this->form_validation->run() == FALSE)
            {
                echo json_encode(array('st' => 0, 'msg' => array('username_alert' => form_error('username'), 'password_alert' => form_error('password'), 'confpassword_alert' => form_error('confpassword'), 'role_alert' => form_error('role'))));
            }
            else
            {

                $date = date('Y-m-d H:i:s');
                
                $user = $this->input->post('username');
                $plainpass = $this->input->post('password');
                $role = $this->input->post('role');
                $hashed = $this->generateHash($plainpass);
                $this->load->model('adminmodel');
                $this->adminmodel->insertAdmin($user, $hashed['pass'], $hashed['salt'], $date, $role);
                echo json_encode(array('st' => 1, 'msg' => 'done'));
            }
        } else {
            show_error('This page content is forbidden');
        }

    }

//function untuk delete admin

    public function delete(){
        if ($this->input->is_ajax_request()) {
            $target = $this->input->post('target');
            $date = date('Y-m-d H:i:s');
            $this->load->model('adminmodel');
            if($this->adminmodel->deleteAdmin($target,$date)){
                echo '1';
            } else {
                echo '0';
            }
        } else {
            show_error("No direct access allowed");
        }
    }

//function untuk ganti password admin
    public function changePassword(){
        if ($this->input->is_ajax_request()){
            $this->load->library('form_validation');

            $this->form_validation->set_rules('oldpassword', 'Old Password', 'required|min_length[8]');
            $this->form_validation->set_rules('newpassword', 'New Password', 'required|min_length[8]');
            $this->form_validation->set_rules('confnewpassword', 'Confirm New Password', 'required|matches[newpassword]');

            if ($this->form_validation->run() == FALSE)
            {
                echo json_encode(array('st' => 0, 'msg' => array('oldpassword_alert' => form_error('oldpassword'), 'newpassword_alert' => form_error('newpassword'), 'confnewpassword_alert' => form_error('confnewpassword'))));
            }
            else
            {
                $id = $this->session->userdata('id');
                $plainpass = $this->input->post('oldpassword');
                $newpass = $this->input->post('newpassword');

                $this->load->model('adminmodel');
                $user = $this->adminmodel->getAdminByID($id);
                foreach ($user->result() as $row){
                    if($this->verify($plainpass, $row->salt, $row->password)){
                        $hashed = $this->generateHash($newpass);
                        $this->adminmodel->updatePasswordAdmin($id, $hashed['pass'], $hashed['salt']);
                        echo json_encode(array('st' => 1, 'msg' => 'done'));
                    } else {
                        echo json_encode(array('st' => 2, 'msg' => 'Your old password is incorrect'));
                    }
                }
            }
        } else {
            show_error('This page content is forbidden');
        }
    }

//function untuk generate enkripsi dari password baru
    private function generateHash($password) {
        if (defined("CRYPT_BLOWFISH") && CRYPT_BLOWFISH) {
            $salt = '$2y$11$' . substr(md5(uniqid(rand(), true)), 0, 22);
            $pass = crypt($password, $salt);
            $res = array(
                'pass' => $pass,
                'salt' => $salt
            );
            return $res;
        }
    }

    private function verify($plain, $salt, $chiper){
        return (crypt($plain, $salt) === $chiper);
    }
}
