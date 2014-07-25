<?php

class Page_model extends CI_Model {
    
    public function getPage($pageId){
        
        $this->db->where("slug", $pageId);
        $this->db->limit(1);
        $query = $this->db->get("page");
        $page = $query->result();
        return $page[0];
        
    }
    
}
