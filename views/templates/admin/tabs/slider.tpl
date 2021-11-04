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
                        <input type="radio" name="ACTIVATE_SLIDER" id="ACTIVATE_SLIDE_on" value="1" checked="checked">
                        <label for="ACTIVATE_SLIDE_on">
                            Oui
                        </label>
                        <input type="radio" name="ACTIVATE_SLIDER" id="ACTIVATE_SLIDE_off" value="0">
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
						<option value="0">{l s='Home Page' mod=''}</option>
                        <option value="1">{l s='Footer' mod=''}</option>																																																	
                    </select>                    
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">
                	{l s='Products per row :' mod='productpricebrand'}
                </label>
                <div class="col-lg-9">
                    <select name="PRODUCT_PER_ROW" class="short-select">
						<option value="0">3</option>
                        <option value="1">4</option>																																																	
                    </select>                    
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-lg-3">
                	<span>{l s='Row number :' mod='productpricebrand'}</span>
                </label>
                <div class="col-lg-9">
                    <select name="ROW_NUMBER" class="short-select">
						<option value="0">1</option>
                        <option value="1">2</option>																																																	
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
                    <input value="0" type="number" class="form-control short-select" required="required">               
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
                    <input value="0" type="number" class="form-control short-select" required="required">               
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