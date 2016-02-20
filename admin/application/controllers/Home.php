<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {
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
//sistem akan masuk ke index ini setelah login berhasil
	public function index()
	{
        $header['title'] = 'Home';
		$this->load->view('header', $header);
        $this->load->view('home/index');
        $this->load->view('footer');
	}
//function untuk destroy session
    public function doLogout(){
        if($this->input->is_ajax_request()){
            $this->session->sess_destroy();
            echo "1";
        } else {
            show_error('This page content is forbidden');
        }
    }

}
