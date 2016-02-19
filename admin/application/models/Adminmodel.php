<?php

class Adminmodel extends CI_Model {

    public function __construct() {
        // Call the CI_Model constructor
        parent::__construct();
    }

    public function getadminList(){
        return $this->db->get('admins');
    }

    public function getadminByID($id){
        $this->db->where('id_admin', $id);
        return $this->db->get('admin');
    }

    public function getAdminByUsername($adminname){
        $this->db->where('username', $adminname);
        return $this->db->get('admins');
    }

    public function insertadmin($id, $admin, $pass, $salt, $date, $role){
        $data = array(
            'id_admin' => $id,
            'adminname_admin' => $admin,
            'password_admin' => $pass,
            'salt_admin' => $salt,
            'dateregistered_admin' => $date,
            'lastlogin_admin' => $date,
            'role_admin' => $role
        );
        return $this->db->insert('admin', $data);
    }

    public function updateadminnameadmin($id, $admin){
        $data['adminname_admin'] = $admin;
        $this->db-where('id_admin', $id);
        return $this->db->update('admin', $data);
    }

    public function updatePasswordadmin($id, $pass, $salt){
        $data = array(
            'password_admin' => $pass,
            'salt_admin' => $salt
        );
        $this->db->where('id_admin', $id);
        return $this->db->update('admin', $data);
    }

    public function updateLastLogin($id, $date){
        $data['lastlogin_admin'] = $date;
        $this->db->where('id_admin', $id);
        return $this->db->update('admin', $data);
    }

    public function deleteadmin($id){
        $this->db->where('id_admin', $id);
        return $this->db->delete('admin');
    }
}
