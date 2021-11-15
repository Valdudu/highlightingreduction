<div class="panel" style="margin-top:3rem;">
    <div class="panel-heading">
        <i class="icon-cogs"></i>
        {l s='Slider configuration' mod='productpricebrand'}
    </div>
    <form method="post" class="form-horizontal">
        <div class="card">
            <div class="form-group">
                <label class="control-label col-lg-3">
					{l s='Activate :' mod='productpricebrand'}
                </label>
                <div class="col-lg-9">
                    <span class="switch prestashop-switch fixed-width-lg">
                        <input type="radio" name="ACTIVATE_SLIDER" id="ACTIVATE_SLIDE_on" value="1" {if $slider_activate==1}checked="checked"{/if}>
                        <label for="ACTIVATE_SLIDE_on">
                            Oui
                        </label>
                        <input type="radio" name="ACTIVATE_SLIDER" id="ACTIVATE_SLIDE_off" value="0"{if $slider_activate==0}checked="checked"{/if}>
                        <label for="ACTIVATE_SLIDE_off">
                            Non
                        </label>
                        <a class="slide-button btn"></a>
                    </span>
                </div>                              
            </div>

            <div class="form-group">
                <label class="control-label col-lg-3">
                	{l s='Choose where to display :' mod='productpricebrand'}
                </label>
                <div class="col-lg-9">
                    <select name="PRODUCT_SLIDER_POSITION" class="short-select">
						<option value="0" {if $slider_hook_position==0}selected{/if}>{l s='Home Page' mod=''}</option>
                        <option value="1" {if $slider_hook_position==1}selected{/if}>{l s='Footer' mod=''}</option>																																																	
                    </select>                    
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-lg-3">
                	{l s='Products per row :' mod='productpricebrand'}
                </label>
                <div class="col-lg-9">
                    <select name="PRODUCT_PER_ROW" class="short-select">
						<option value="3" {if $slider_product_per_row==3}selected{/if}>3</option>
                        <option value="4" {if $slider_product_per_row==4}selected{/if}>4</option>																																																	
                    </select>                    
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-lg-3">
                	<span>{l s='Row number :' mod='productpricebrand'}</span>
                </label>
                <div class="col-lg-9">
                    <select name="ROW_NUMBER" class="short-select">
						<option value="1" {if $slider_product_row==1}selected{/if}>1</option>
                        <option value="2" {if $slider_product_row==2}selected{/if}>2</option>																																																	
                    </select>                    
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-lg-3">
                    <span class="label-tooltip" data-toggle="tooltip" data-html="true" title="" 
                        data-original-title="0 mean no limit">
                	{l s='Maximum number of product to display:' mod='productpricebrand'}
                    </span>
                </label>
                <div class="col-lg-9">
                    <input value="{$slider_number_to_display}" type="number" name="SLIDER_MAX_PRODUCT" class="form-control short-select" required="required">               
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-lg-3">
                    <span class="label-tooltip" data-toggle="tooltip" data-html="true" title="" 
                        data-original-title="0 mean no limit">
                	{l s='Show discounts that end in less than (in hours) :' mod='productpricebrand'}
                    </span>
                </label>
                <div class="col-lg-9">
                    <input value="{$slider_discount_end}" type="number" name="SLIDER_DISCOUNT_END" class="form-control short-select" required="required">               
                </div>
            </div>
        </div>
        <div class="panel-footer"> 
	    	<ps-panel-footer-link title="Retour" icon="icon-arrow-circle-left" fa="fa-arrow-circle-left" direction="left" href="index.php?">
	        	<a class="btn btn-default pull-left" href="index.php?"> <i class="icon-arrow-circle-left"></i> {l s='Back' mod='productpricebrand'} </a>
	        </ps-panel-footer-link> 
	        <ps-panel-footer-submit title="Enregistrer" icon="process-icon-save" fa="floppy-o" direction="right" name="saveslider">
	        	<button type="submit" class="btn btn-default pull-right" name="saveslider"> <i class="process-icon-save"></i> {l s='Save' mod='productpricebrand'} </button>
	        </ps-panel-footer-submit>
	    </div>	
    </form>
</div>