<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Action extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	public function index()
	{
		//ini untuk menampilkan view  action
		
		$this->showAction();
		

	}

	public function showAction(){
		$this->load->model('actionmodel');
		$actiontable=$this->actionmodel->actionList();
		$this->load->view('header');
		$this->load->view('action/begin');
		foreach ($actiontable as $row['data']) {
			
			$this->load->view('action/single_action', $row);
		}
		$this->load->view('action/end');
		$this->load->view('action/sidebar');
		$this->load->view('footer');

	}


	public function mostLike(){

	}


	public function byCategoties(){

	}
	
}
