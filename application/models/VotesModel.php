<?php

class VotesModel extends CI_Model
{
	
	public function __construct()
	{
		parent::__construct();
		$config['hostname'] = "localhost";
		$config['dbdriver'] = "mysqli";
		$config['database'] = "finitivedb";
		$config['username'] = 'root';
		$config['password'] = 'kenny';
		
		$this->load->database($config);
		
		
	}
	
	public function getAll_Data()
	{
		$sql = "SELECT * FROM votes";
		$hasil = $this->db->query($sql);
		return $hasil;
		
	}
	
	public function getTotal_Votes()
	{
		$sql =  'SELECT a.title AS title, b.actions_id as id,
					count(id) as total_votes
					FROM actions a inner join votes b
					on a.id = b.actions_id AND a.deleted_at IS NULL AND b.deleted_at IS NULL
					GROUP BY b.actions_id  ORDER BY total_votes DESC ';
					
	$hasil = $this->db->query($sql);
	
	return $hasil;

	}
	
	
	

	
}