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
                        data-original-title="Veuillez utiliser un cookie spécial si votre thème ne prend pas en charge les cookies standards OU si vous souhaitez placer un compte à rebours dans un emplacement non standard. Cf. le bloc &amp;quot;Informations supplémentaires&amp;quot;.
												">
																				{l s='Reduction type' mod='productpricebrand'}
					</span>
                </label>
                <div class="col-lg-9" style="padding-top:7px;">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                        <label class="form-check-label" for="flexCheckDefault">
                            Product specific price
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault2">
                        <label class="form-check-label" for="flexCheckDefault2">
                            Reduction
                        </label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">
                    <span class="label-tooltip" data-toggle="tooltip" data-html="true" title="" 
                        data-original-title="{l s='Choose your countdown style' mod='productpricebrand'}">
						{l s='Object' mod='productpricebrand'}
					</span>
                </label>
                <div class="col-lg-9 pspc-themes-wrp themes-wrp-17">
                    <div class="row">
                        <div class="col-lg-3 col-md-4 col-xs-6 raio"><label><input type="radio" name="THEME" id="theme-1-simple" value="1-simple.css" data-theme="1-simple" checked="checked"><img class="theme-img" src="/prestashop7/modules/psproductcountdown/views/img/themes/1-simple.png" alt="1-simple"></label></div>
                        <div class="col-lg-3 col-md-4 col-xs-6 raio"><label><input type="radio" name="THEME" id="theme-2-dark" value="2-dark.css" data-theme="2-dark"><img class="theme-img" src="/prestashop7/modules/psproductcountdown/views/img/themes/2-dark.png" alt="2-dark"></label></div>
                    </div>
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