<?php

class Usermodel extends CI_Model {

    public function __construct() {
        // Call the CI_Model constructor
        parent::__construct();
    }

    public function getUserList(){
        return $this->db->get('user');
    }

    public function getUserByID($id){
        $this->db->where('id_user', $id);
        return $this->db->get('user');
    }

    public function getUserByUsername($username){
        $this->db->where('username_user', $username);
        return $this->db->get('user');
    }

    public function insertUser($id, $user, $pass, $salt, $date, $role){
        $data = array(
            'id_user' => $id,
            'username_user' => $user,
            'password_user' => $pass,
            'salt_user' => $salt,
            'dateregistered_user' => $date,
            'lastlogin_user' => $date,
            'role_user' => $role
        );
        return $this->db->insert('user', $data);
    }

    public function updateUsernameUser($id, $user){
        $data['username_user'] = $user;
        $this->db-where('id_user', $id);
        return $this->db->update('user', $data);
    }

    public function updatePasswordUser($id, $pass, $salt){
        $data = array(
            'password_user' => $pass,
            'salt_user' => $salt
        );
        $this->db->where('id_user', $id);
        return $this->db->update('user', $data);
    }

    public function updateLastLogin($id, $date){
        $data['lastlogin_user'] = $date;
        $this->db->where('id_user', $id);
        return $this->db->update('user', $data);
    }

    public function deleteUser($id){
        $this->db->where('id_user', $id);
        return $this->db->delete('user');
    }
}
