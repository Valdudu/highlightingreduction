<div class="panel" style="margin-top:3rem;">
    <div class="panel-heading">
        <i class="icon-cogs"></i>
        {l s='Product page configuration' mod='productpricebrand'}
    </div>

    <form method="post" class="form-horizontal">
        <div class="form-group">
            <label class="col-lg-3 control-label">
                {l s='Activate' mod='productpricebrand'}
            </label>
            <div class="col-lg-9">
                <span class="switch prestashop-switch fixed-width-lg">
                    <input type="radio" name="P_ACTIVATE" id="P_ACTIVATE_on" value=1 {if $P_ACTIVATE==1}checked="checked"{/if}>
                    <label for="P_ACTIVATE_on">
                        Oui
                    </label>
                    <input type="radio" name="P_ACTIVATE" id="P_ACTIVATE_off" value=0 {if $P_ACTIVATE==0}checked="checked"{/if}>
                    <label for="P_ACTIVATE_off">
                        Non
                    </label>
                    <a class="slide-button btn"></a>
                </span>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-lg-3">
                {l s='Position in product page' mod='productpricebrand'}
            </label>
            <div class="col-lg-3">
                <select name="C_P_POSITION" class="short-select">
                    <option value=1 {if $P_POSITION==1}selected{/if}>{l s='Sous le prix' mod='productpricebrand'}</option>
                    <option value=2 {if $P_POSITION==2}selected{/if}>{l s='Sous les boutons' mod='productpricebrand'}</option>																																																	
                </select>   
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-lg-3">
                <span class="label-tooltip"  data-toggle="tooltip" data-html="true" data-original-title="{l s='You don\'t have to put any text' mod='productpricebrand'}">
                {l s='Add a short text above the timer' mod='productpricebrand'}
            </label>
            <div class="col-lg-9">
                <input type="text" name="C_P_TEXT" value="{$P_TEXT}" class="short-select tit">
            </div> 
        </div>
        <div class="panel-footer"> 
	    	<ps-panel-footer-link title="Retour" icon="icon-arrow-circle-left" fa="fa-arrow-circle-left" direction="left" href="index.php?">
	        	<a class="btn btn-default pull-left" href="index.php?"> <i class="icon-arrow-circle-left"></i> {l s='Back' mod='productpricebrand'} </a>
	        </ps-panel-footer-link> 
	        <ps-panel-footer-submit title="Enregistrer" icon="process-icon-save" fa="floppy-o" direction="right" name="saveproduct">
	        	<button type="submit" class="btn btn-default pull-right" name="saveproduct"> <i class="process-icon-save"></i> {l s='Save' mod='productpricebrand'} </button>
	        </ps-panel-footer-submit>
	    </div>	
    </form>
</div>