<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {


//funtion contruct untuk mengidentifikasi analisa sebelum masuk ke function index. 
//di sini di filter sessionnya apakah sudah melakukan login atau belum. 
//bila sudah pernah login dan belum logout atau belum d destroy cache nya maka di redirect di base url, 
//yaitu finitive.pro/admin/Home

    public function __construct(){
        
        parent::__construct();
        $this->load->library('session');
        if($this->session->userdata('finadmin') == 'yesiam'){
            redirect(base_url());
        }
    }

//halaman awal web akan menampilkan halaman admin terletak di view/login/index

	public function index()
	{
        
        $this->load->view('login/index');
	}


//function untuk melakukan login

    public function doLogin(){
        if($this->input->is_ajax_request()){
            $username = $this->input->post('username');
            $password = $this->input->post('password');

            $this->load->model('adminmodel');
            $admin = $this->adminmodel->getAdminByUsername($username);
            if($admin->num_rows() == 1){
                foreach ($admin->result() as $row){
                    if($this->verify($password, $row->salt, $row->password)&&($row->deleted_at == NULL)){

                        $this->session->set_userdata('id', $row->id);
                        $this->session->set_userdata('username', $row->username);

                        if($row->previllage==1){
                             $this->session->set_userdata('role', 'General Admin');
                        }
                        elseif($row->previllage==2){
                            $this->session->set_userdata('role', 'Blog Admin');
                        }
                        elseif($row->previllage==3){
                            $this->session->set_userdata('role', 'Aproval Action Admin');
                        }


                       
                        $this->session->set_userdata('coderole', $row->previllage);
                        $this->session->set_userdata('finadmin', 'yesiam');

                        
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

//function untuk generate kode enkripsi

    private function verify($plain, $salt, $chiper){
        return (crypt($plain, $salt) === $chiper);
    }
}
