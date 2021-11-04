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

<div class="panel" style="margin-top:3rem;">
    <div class="panel-heading">
        <i class="icon-cogs"></i>
        {l s='General configuration' mod='productpricebrand'}
    </div>
    <form method="post" class="form-horizontal">
        <div class="card">
            <div class="form-group">
                <label class="control-label col-lg-3">
                    <span class="label-tooltip" data-toggle="tooltip" data-html="true" title="" 
                        data-original-title="{l s='Choose your countdown style' mod='productpricebrand'}">
						{l s='Object' mod='productpricebrand'}
					</span>
                </label>
                <div class="col-lg-9 pspc-themes-wrp themes-wrp-17">
                    <div class="row">
                        <div class="col-lg-3 col-md-4 col-xs-6 raio"><label><input type="radio" name="THEME" id="theme-1-simple" value="0" data-theme="1-simple" {if $object==0}checked="checked"{/if}><img class="theme-img" src="/prestashop7/modules/psproductcountdown/views/img/themes/1-simple.png" alt="1-simple"></label></div>
                        <div class="col-lg-3 col-md-4 col-xs-6 raio"><label><input type="radio" name="THEME" id="theme-2-dark" value="1" data-theme="2-dark" {if $object==1}checked="checked"{/if}><img class="theme-img" src="/prestashop7/modules/psproductcountdown/views/img/themes/2-dark.png" alt="2-dark"></label></div>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-lg-3">
                    {l s='Display a countdown on product page' mod='productpricebrand'}
                </label>
                <div class="col-lg-9">
                    <span class="switch prestashop-switch fixed-width-lg">
                        <input type="radio" name="ACTIVATE_PRODUCT_PAGE" id="ACTIVATE_PRODUCT_PAGE_on" value="1" {if $product_page==1}checked="checked"{/if}>
                        <label for="ACTIVATE_PRODUCT_PAGE_on">
                            Oui
                        </label>
                        <input type="radio" name="ACTIVATE_PRODUCT_PAGE" id="ACTIVATE_PRODUCT_PAGE_off" value="0" {if $product_page==0}checked="checked"{/if}>
                        <label for="ACTIVATE_PRODUCT_PAGE_off">
                            Non
                        </label>
                        <a class="slide-button btn"></a>
                    </span>
                </div> 
            </div>
            
            <div class="form-group select_product_position" style="visibility:hidden;">
                <label class="control-label col-lg-3">
                    {l s='Position on product page' mod='productpricebrand'}
                </label>
                <div class="col-lg-9">
                    <select name="PRODUCT_PAGE_POSITION" class="short-select">
						<option value="0" {if $product_page_position==0}selected{/if}>{l s='Under the price' mod=''}</option>
                        <option value="1"{if $product_page_position==1}selected{/if}>{l s='Under the buttons' mod=''}</option>																																																	
                    </select>                    
                </div> 
            </div>

            <div class="form-group">
                <label class="control-label col-lg-3">
                    {l s='Display on category page' mod='productpricebrand'}
                </label>
                <div class="col-lg-9">
                    <span class="switch prestashop-switch fixed-width-lg">
                        <input type="radio" name="ACTIVATE_CATEGORY_LIST" id="ACTIVATE_CAETGORY_LIST_on" value="1" {if $category_page==1}checked="checked"{/if}>
                        <label for="ACTIVATE_CAETGORY_LIST_on">
                            Oui
                        </label>
                        <input type="radio" name="ACTIVATE_CATEGORY_LIST" id="ACTIVATE_CAETGORY_LIST_off" value="0" {if $category_page==0}checked="checked"{/if}>
                        <label for="ACTIVATE_CAETGORY_LIST_off">
                            Non
                        </label>
                        <a class="slide-button btn"></a>
                    </span>
                </div> 
            </div>

        </div>
        <div class="panel-footer"> 
	    	<ps-panel-footer-link title="Retour" icon="icon-arrow-circle-left" fa="fa-arrow-circle-left" direction="left" href="index.php?">
	        	<a class="btn btn-default pull-left" href="index.php?"> <i class="icon-arrow-circle-left"></i> {l s='Back' mod='productpricebrand'} </a>
	        </ps-panel-footer-link> 
	        <ps-panel-footer-submit title="Enregistrer" icon="process-icon-save" fa="floppy-o" direction="right" name="savegeneral">
	        	<button type="submit" class="btn btn-default pull-right" name="saveconfiguration"> <i class="process-icon-save"></i> {l s='Save' mod='productpricebrand'} </button>
	        </ps-panel-footer-submit>
	    </div>	
    </form>
</div>