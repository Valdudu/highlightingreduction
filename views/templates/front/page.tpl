{extends file='page.tpl'}
{block name='page_title'}
    {l s='Our stores' mod='assemblystation'}
{/block}
{*{extends file='catalog/listing/product-list.tpl'}*}
{block name='page_content_container'}

    <h1> text</h1>
    {include file='catalog/_partials/productlist.tpl' products=$products}
{/block}