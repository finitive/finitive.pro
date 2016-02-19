<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->library('session');
        if(!$this->session->userdata('finadmin') == 'yesiam'){
            redirect(base_url().'login');
        }
    }

	public function index()
	{
        $header['title'] = 'Home';
		$this->load->view('header', $header);
        $this->load->view('home/index');
        $this->load->view('footer');
	}

    public function doLogout(){
        if($this->input->is_ajax_request()){
            $this->session->sess_destroy();
            echo "1";
        } else {
            show_error('This page content is forbidden');
        }
    }

}
