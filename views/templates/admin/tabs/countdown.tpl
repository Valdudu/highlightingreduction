<div class="panel" style="margin-top:3rem;">
    <div class="panel-heading">
        <i class="icon-cogs"></i>
        {l s='Countdown configuration' mod='productpricebrand'}
    </div>
    <form method="post" class="form-horizontal">
        <div class="card">

            <div class="form-group">
                <label class="control-label col-lg-3">
                    {l s='Activate' mod='productpricebrand'}
                </label>
                <div class="col-lg-9">
                    <span class="switch prestashop-switch fixed-width-lg">
                        <input type="radio" name="ACTIVATE_COUNTDOWN" id="ACTIVATE_COUNTDOWN_on" value="1" {if $C_ACTIVATE==1}checked="checked"{/if}>
                        <label for="ACTIVATE_COUNTDOWN_on">
                            Oui
                        </label>
                        <input type="radio" name="ACTIVATE_COUNTDOWN" id="ACTIVATE_COUNTDOWN_off" value="0" {if $C_ACTIVATE==0}checked="checked"{/if}>
                        <label for="ACTIVATE_COUNTDOWN_off">
                            Non
                        </label>
                        <a class="slide-button btn"></a>
                    </span>
                </div> 
            </div>

            <div class="form-group">
                <label class="control-label col-lg-3">
                    <span class="label-tooltip" data-toggle="tooltip" data-html="true" title="" 
                        data-original-title="{l s='Choose your countdown style' mod='productpricebrand'}">
						{l s='Style' mod='productpricebrand'}
					</span>
                </label>
                <div class="col-lg-9 pspc-themes-wrp themes-wrp-17">
                    <div class="row">
                        <div class="col-lg-3 col-md-4 col-xs-6 raio"><label><input type="radio" name="object_style" id="theme-1-simple" value="1-simple" data-theme="1-simple" {if $C_STYLE=="1-simple"}checked="checked"{/if}><img class="theme-img" src="/prestashop7/modules/psproductcountdown/views/img/themes/1-simple.png" alt="1-simple"></label></div>
                        <div class="col-lg-3 col-md-4 col-xs-6 raio"><label><input type="radio" name="object_style" id="theme-2-dark" value="2-dark" data-theme="2-dark" {if $C_STYLE=="2-dark"}checked="checked"{/if}><img class="theme-img" src="/prestashop7/modules/psproductcountdown/views/img/themes/2-dark.png" alt="2-dark"></label></div>
                    </div>
                </div>
            </div>          

            <div class="form-group">
                <label class="control-label col-lg-3">
                    {l s='Display everywhere' mod='productpricebrand'}
                </label>
                <div class="col-lg-9">
                    <span class="switch prestashop-switch fixed-width-lg">
                        <input type="radio" name="COUNTDOWN_DISPLAY_EVERYWHERE" id="COUNTDOWN_DISPLAY_EVERYWHERE_on" value=1 {if $C_D_ALL==1}checked="checked"{/if}>
                        <label for="COUNTDOWN_DISPLAY_EVERYWHERE_on">
                            Oui
                        </label>
                        <input type="radio" name="COUNTDOWN_DISPLAY_EVERYWHERE" id="COUNTDOWN_DISPLAY_EVERYWHERE_off" value=0 {if $C_D_ALL==0}checked="checked"{/if}>
                        <label for="COUNTDOWN_DISPLAY_EVERYWHERE_off">
                            Non
                        </label>
                        <a class="slide-button btn"></a>
                    </span>
                </div> 
            </div>
            <div class="display" {if $C_D_ALL==1} style="visibility: hidden"{/if}>
                <div class="form-group">
                    <label class="control-label col-lg-3">
                        {l s='Category pages' mod='productpricebrand'}
                    </label>
                    <div class="col-lg-9">
                        <span class="switch prestashop-switch fixed-width-lg">
                            <input type="radio" name="COUNTDOWN_DISPLAY_CATEGORY" id="COUNTDOWN_DISPLAY_CATEGORY_on" value=1 {if $C_D_C==1}checked="checked"{/if}>
                            <label for="COUNTDOWN_DISPLAY_CATEGORY_on">
                                Oui
                            </label>
                            <input type="radio" name="COUNTDOWN_DISPLAY_CATEGORY" id="COUNTDOWN_DISPLAY_CATEGORY_off" value=0 {if $C_D_C==0}checked="checked"{/if}>
                            <label for="COUNTDOWN_DISPLAY_CATEGORY_off">
                                Non
                            </label>
                            <a class="slide-button btn"></a>
                        </span>
                    </div> 
                </div>
                            
                <div class="form-group">
                    <label class="control-label col-lg-3">
                        {l s='Promotions pages' mod='productpricebrand'}
                    </label>
                    <div class="col-lg-9">
                        <span class="switch prestashop-switch fixed-width-lg">
                            <input type="radio" name="COUNTDOWN_DISPLAY_PROMO" id="COUNTDOWN_DISPLAY_PROMO_on" value=1 {if $C_D_P==1}checked="checked"{/if}>
                            <label for="COUNTDOWN_DISPLAY_PROMO_on">
                                Oui
                            </label>
                            <input type="radio" name="COUNTDOWN_DISPLAY_PROMO" id="COUNTDOWN_DISPLAY_PROMO_off" value=0 {if $C_D_P==0}checked="checked"{/if}>
                            <label for="COUNTDOWN_DISPLAY_PROMO_off">
                                Non
                            </label>
                            <a class="slide-button btn"></a>
                        </span>
                    </div> 
                </div>
                            
                <div class="form-group">
                    <label class="control-label col-lg-3">
                        {l s='Brands pages' mod='productpricebrand'}
                    </label>
                    <div class="col-lg-9">
                        <span class="switch prestashop-switch fixed-width-lg">
                            <input type="radio" name="COUNTDOWN_DISPLAY_BRAND" id="COUNTDOWN_DISPLAY_BRAND_on" value=1 {if $C_D_B==1}checked="checked"{/if}>
                            <label for="COUNTDOWN_DISPLAY_BRAND_on">
                                Oui
                            </label>
                            <input type="radio" name="COUNTDOWN_DISPLAY_BRAND" id="COUNTDOWN_DISPLAY_BRAND_off" value=0 {if $C_D_B==0}checked="checked"{/if}>
                            <label for="COUNTDOWN_DISPLAY_BRAND_off">
                                Non
                            </label>
                            <a class="slide-button btn"></a>
                        </span>
                    </div> 
                </div>

                <div class="form-group">
                    <label class="control-label col-lg-3">
                        {l s='Home Page' mod='productpricebrand'}
                    </label>
                    <div class="col-lg-9">
                        <span class="switch prestashop-switch fixed-width-lg">
                            <input type="radio" name="COUNTDOWN_DISPLAY_INDEX" id="COUNTDOWN_DISPLAY_INDEX_on" value=1 {if $C_D_I==1}checked="checked"{/if}>
                            <label for="COUNTDOWN_DISPLAY_INDEX_on">
                                Oui
                            </label>
                            <input type="radio" name="COUNTDOWN_DISPLAY_INDEX" id="COUNTDOWN_DISPLAY_INDEX_off" value=0 {if $C_D_I==0}checked="checked"{/if}>
                            <label for="COUNTDOWN_DISPLAY_INDEX_off">
                                Non
                            </label>
                            <a class="slide-button btn"></a>
                        </span>
                    </div> 
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">
                    <span class="label-tooltip"  data-toggle="tooltip" data-html="true" data-original-title="{l s='You don\'t have to put any text' mod='productpricebrand'}">
                    {l s='Add a short text above the timer' mod='productpricebrand'}
                </label>
                <div class="col-lg-9">
                    <input type="text" name="COUNTDOWN_TEXT" value="{$C_TEXT}" class="short-select tit">
                </div> 
            </div>
        </div>
        <div class="panel-footer"> 
	    	<ps-panel-footer-link title="Retour" icon="icon-arrow-circle-left" fa="fa-arrow-circle-left" direction="left" href="index.php?">
	        	<a class="btn btn-default pull-left" href="index.php?"> <i class="icon-arrow-circle-left"></i> {l s='Back' mod='productpricebrand'} </a>
	        </ps-panel-footer-link> 
	        <ps-panel-footer-submit title="Enregistrer" icon="process-icon-save" fa="floppy-o" direction="right" name="savecountdown">
	        	<button type="submit" class="btn btn-default pull-right" name="savecountdown"> <i class="process-icon-save"></i> {l s='Save' mod='productpricebrand'} </button>
	        </ps-panel-footer-submit>
	    </div>	
    </form>
</div>
