{**
* NOTICE OF LICENSE
*
* This file is licenced under the Software License Agreement.
* With the purchase or the installation of the software in your application
* you accept the licence agreement.
*
* @author    Presta.Site
* @copyright 2018 Presta.Site
* @license   LICENSE.txt
*}
<div class="pspc-wrp pspc-wrp-over-img pspc-valign-{$pspc_vertical_align|escape:'quotes':'UTF-8'}">
    <div class="psproductcountdown compact_view"
         data-to="{$to_time|escape:'html':'UTF-8'}"
         data-name="{if $name}{$name|escape:'html':'UTF-8'}{else}{l s='Offer ends in:' mod='psproductcountdown'}{/if}"
         data-id-countdown="{$id|intval}"
    >
        <div class="pspc-main">
            <div class="pspc-offer-ends">
                {if $name}
                    {$name|escape:'html':'UTF-8'}
                {else}
                    {l s='Offer ends in:' mod='psproductcountdown'}
                {/if}
            </div>
        </div>
    </div>
</div>
<script>
    if (typeof pspc_initCountdown === 'function') {
        pspc_initCountdown('.{$id|escape:'html':'UTF-8'}');
    }
</script>
