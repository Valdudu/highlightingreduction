{*
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
*}

<div class="bootstrap">
    <div class="page-head custom-tab">
        <div class="page-head-tabs" id="head_tabs">
            <ul class="nav">
				<li class="active">
                    <a href="#slider_configure" data-toggle="tab">{l s='SLIDER CONFIGURE' mod='productpricebrand'}</a>
                </li>
                <li >
                    <a href="#countdown_configure" data-toggle="tab">{l s='TIMER' mod='productpricebrand'}</a>
                </li>                
                <li >
                    <a href="#product_configure" data-toggle="tab">{l s='PRODUCT PAGE' mod='productpricebrand'}</a>
                </li>
                <li >
                    <a href="#product_list_configure" data-toggle="tab">{l s='PRODUCT LIST' mod='productpricebrand'}</a>
                </li>               
            </ul>
        </div>
    </div>
</div>
<div class="bootstrap">
    <!-- Module content -->
    <div id="modulecontent" class="clearfix">
        <!-- Tab panes -->
        <div class="tab-content row">
            
			<div class="tab-pane active" id="slider_configure">
                <div class="tab_cap_listing">
                    {include file="./tabs/slider.tpl"}
                </div>
            </div>
            <div class="tab-pane" id="countdown_configure">
                <div class="tab_cap_listing">
                    {include file="./tabs/countdown.tpl"}
                </div>
            </div>
            <div class="tab-pane" id="product_configure">
                <div class="tab_cap_listing">
                    {include file="./tabs/product.tpl"}
                </div>
            </div>            
            <div class="tab-pane" id="product_list_configure">
                <div class="tab_cap_listing">
                    {include file="./tabs/product_list.tpl"}
                </div>
            </div>            
        </div>
    </div>
</div>