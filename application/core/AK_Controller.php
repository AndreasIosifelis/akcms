<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class AK_Controller extends CI_Controller {
    
    private $langId;
    private $defaultLanguageId = "gr";
    
    public function __construct() {
        parent::__construct();
        $this->langId = $this->session->userdata("lang_id") ? $this->session->userdata("lang_id") : $this->defaultLanguageId;
        require_once "application/language/{$this->langId}.php";
    }
    
   
    
    
    
    
    
}
