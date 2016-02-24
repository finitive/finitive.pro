<?php

Class Makesmodel extends CI_Model{
	
	public function __construct() {
        // Call the CI_Model constructor
        parent::__construct();
    }

    //function ambil user dari makes
    function get_all actionList(){
    	$query = $this->db->query('SELECT makes.actions_id, users.name, actions.title , actions.tag_line, actions.short_description, actions.goal_founding, actions.date_upload, actions.date_expired, actions.url_photo1, cities.city FROM makes INNER JOIN users ON makes.users_id = users.id AND INNER JOIN actions ON makes.actions_id = actions.id');
        $row = $query->result();
        if ($query->num_rows() == 0) {
            return FALSE;
        } else {
            return $row;
        }
    }



}



// <?php

// Class Actionmodel extends CI_Model{
    
//     public function __construct() {
//         // Call the CI_Model constructor
//         parent::__construct();
//     }


//     //function untuk ambil semua data actions
//     function get_all actionList(){
//         $query = $this->db->query('SELECT actions.id , actions.title , actions.tag_line, actions.short_description, actions.goal_founding, actions.date_expired,actions.url_photo1, cities.city,users.name FROM actions INNER JOIN cities ON actions.cities_id = cities.id INNER JOIN users ON actions.users_id = users.id');
//         $row = $query->result();
//         if ($query->num_rows() == 0) {
//             return FALSE;
//         } else {
//             return $row;
//         }
//     }


// }