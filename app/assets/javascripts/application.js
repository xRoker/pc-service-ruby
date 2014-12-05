// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require jquery.turbolinks

var main = function () {

    $('.navbar-right').click( function(event){
        event.stopPropagation();
        $('.dropdown-menu').toggle();
    });

    $(document).click( function(){
        $('.dropdown-menu').hide();
    });


    if ($("#address-select :selected").val() == -1) {
        $('.address-block').show();
    }

    $('#address-select').change( function(){
        if ($("#address-select :selected").val() == -1) {
            $('.address-block').show();
        } else {
            $('.address-block').hide();
        }
    })



}

function showPassword() {
    
    var key_attr = $('#key').attr('type');
    
    if(key_attr != 'text') {
        
        $('.checkbox').addClass('show');
        $('#key').attr('type', 'text');
        
    } else {
        
        $('.checkbox').removeClass('show');
        $('#key').attr('type', 'password');
        
    }
    
}



function tableClicker() {
    $('#request-list tr').click(function (event) {
        var id = $(this).data('value');
        $('tr').css({"backgroundColor": "#ffffff"});
        
        if($("#block"+id).hasClass("out")) {
            
            $(".collapse").removeClass("in");
            $(".collapse").addClass("out");
            $("#block"+id).addClass("in");
            $("#block"+id).removeClass("out");
            $(this).css({"backgroundColor": "#e9ebed"});    
            $("#block"+id).css({"backgroundColor": "#e9ebed"});

        } else {
            $("#block"+id).addClass("out");
            $("#block"+id).removeClass("in");
        }

    });

    $('#request-tabs li').click(function (event){
        $('#request-tabs li').removeClass("active");
        $(this).addClass("active");

        $(".collapse").removeClass("in");
        $(".collapse").addClass("out");

        if ( $(this).attr('id') == 'pending-tab') {
            $('.accepted').hide();
            $('.pending').show();
        } else {
            $('.pending').hide();
            $('.accepted').show();
        }
    });
}

$(document).ready(tableClicker);
$(document).ready(main);