/**
* 2007-2021 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2021 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*
* Don't forget to prefix your containers with your own identifier
* to avoid any conflicts with others containers.
*/

$(document).ready(function(){
//$("input[name='ACTIVATE_PRODUCT_PAGE']").click(function(){
    $("input[name='ACTIVATE_PRODUCT_PAGE']").click(function(){
        if($("input[name='ACTIVATE_PRODUCT_PAGE']:checked").val()==1){
            $(".select_product_position").css("visibility", "visible");            
        }else{
            $(".select_product_position").css("visibility", "hidden");            
        }
    });
    $("select[name='SLIDER_ORDER_BY']").click(function(){
        if($("select[name='SLIDER_ORDER_BY']").val()=="random"){
            $(".way").css("visibility", "hidden");
        }else{
            $(".way").css("visibility", "visible");            

        }
    });
    $("input[name='COUNTDOWN_DISPLAY_EVERYWHERE']").click(function(){
        if($("input[name='COUNTDOWN_DISPLAY_EVERYWHERE']:checked").val()==0){
            $(".display").css("visibility", "visible"); 
        }else{
            $(".display").css("visibility", "hidden");             
        }
    });
    
});