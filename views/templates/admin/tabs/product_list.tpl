<div class="panel" style="margin-top:3rem;">
    <div class="panel-heading">
        <i class="icon-cogs"></i>
        {l s='Promotion page configuration' mod='productpricebrand'}
    </div>
    <form method="post" class="form-horizontal">
        <div class="card">

            <div class="form-group">
                <label class="col-lg-3 control-label">
                    {l s='Activate:' mod='productpricebrand'}
                </label>
                <div class="col-lg-9">
                    <span class="switch prestashop-switch fixed-width-lg">
                        <input type="radio" name="ACTIVATE_DISCOUNT_PAGE" id="ACTIVATE_DISCOUNT_PAGE_on" value="1" {if $page_activate==1}checked="checked"{/if}>
                        <label for="ACTIVATE_DISCOUNT_PAGE_on">
                            Oui
                        </label>
                        <input type="radio" name="ACTIVATE_DISCOUNT_PAGE" id="ACTIVATE_DISCOUNT_PAGE_off" value="0" {if $page_activate==0}checked="checked"{/if}>
                        <label for="ACTIVATE_DISCOUNT_PAGE_off">
                            Non
                        </label>
                        <a class="slide-button btn"></a>
                    </span>
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
                    <input value="{$page_discount_end}" type="number" name="PAGE_DISCOUNT_END" class="form-control short-select" required="required">               
                </div>
            </div>
        </div>

        <div class="panel-footer"> 
	    	<ps-panel-footer-link title="Retour" icon="icon-arrow-circle-left" fa="fa-arrow-circle-left" direction="left" href="index.php?">
	        	<a class="btn btn-default pull-left" href="index.php?"> <i class="icon-arrow-circle-left"></i> {l s='Back' mod='productpricebrand'} </a>
	        </ps-panel-footer-link> 
	        <ps-panel-footer-submit title="Enregistrer" icon="process-icon-save" fa="floppy-o" direction="right" name="saveslider">
	        	<button type="submit" class="btn btn-default pull-right" name="savelist"> <i class="process-icon-save"></i> {l s='Save' mod='productpricebrand'} </button>
	        </ps-panel-footer-submit>
	    </div>	
    </form>
</div>
