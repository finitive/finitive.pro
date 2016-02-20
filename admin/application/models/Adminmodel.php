<?php

class Adminmodel extends CI_Model {

    public function __construct() {
        // Call the CI_Model constructor
        parent::__construct();
    }
//fungsi untuk ambil tabel admins
    public function getAdminList(){
        return $this->db->get('admins');
    }
//fungsi untuk ambil tabel adminsbyid

    public function getAdminByID($id){
        $this->db->where('id', $id);
        return $this->db->get('admins');
    }

//fungsi untuk ambil tabel admins by username

    public function getAdminByUsername($adminname){
        $this->db->where('username', $adminname);
        return $this->db->get('admins');
    }

//fungsi untuk insert tabel admin untuk daftar admin baru

    public function insertAdmin($admin, $pass, $salt, $date, $role){
        $data = array(
            'username' => $admin,
            'password' => $pass,
            'salt' => $salt,
            'created_at' => $date,
            'previllage' => $role
        );
        return $this->db->insert('admins', $data);
    }
//fungsi untuk update nama admin

    public function updateadminnameadmin($id, $admin){
        $data['adminname_admin'] = $admin;
        $this->db-where('id_admin', $id);
        return $this->db->update('admin', $data);
    }
//fungsi untuk change password

    public function updatePasswordAdmin($id, $pass, $salt){
        $data = array(
            'password' => $pass,
            'salt' => $salt
        );
        $this->db->where('id', $id);
        return $this->db->update('admins', $data);
    }
//fungsi untuk insert last_login

    public function updateLastLogin($id, $date){
        $data['lastlogin_admin'] = $date;
        $this->db->where('id_admin', $id);
        return $this->db->update('admin', $data);
    }
    //fungsi untuk delete admin

    public function deleteAdmin($id,$date){
        $data['deleted_at'] = $date;
        $this->db->where('id', $id);
        return $this->db->update('admins', $data);
    }
}
