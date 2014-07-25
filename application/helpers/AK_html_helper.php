<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

if(!function_exists("js")){
    
    function js($file){
        $file = ENVIRONMENT == 'development' ? $file.".js" : $file.".min.js";
        return "<script src='".base_url("assets/js/{$file}")."'></script>";
    }
    
}


if(!function_exists('css')){
    
    function css($file){
        $file = ENVIRONMENT == 'development' ? $file.".css" : $file.".min.css";
        return "<link href='".base_url("assets/css/{$file}")."' rel='stylesheet' type='text/css' />";
    }
    
}
