/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var AKCMS = AKCMS || {};


$(function() {
    AKCMS.initialize();
});


AKCMS.initialize = function() {
    $(document).foundation({
        top_bar: {
            custom_back_text: true,
            back_text: "Πίσω"
        }
    });
};





