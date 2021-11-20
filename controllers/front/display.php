<?php
use PrestaShop\PrestaShop\Core\Product\Search\Facet;
use PrestaShop\PrestaShop\Core\Product\Search\FacetsRendererInterface;
use PrestaShop\PrestaShop\Core\Product\Search\Pagination;
use PrestaShop\PrestaShop\Core\Product\Search\ProductSearchContext;
use PrestaShop\PrestaShop\Core\Product\Search\ProductSearchProviderInterface;
use PrestaShop\PrestaShop\Core\Product\Search\ProductSearchQuery;
use PrestaShop\PrestaShop\Core\Product\Search\ProductSearchResult;
use PrestaShop\PrestaShop\Core\Product\Search\SortOrder;

require_once __DIR__.'/../../highlightingreduction.php';
require_once __DIR__.'/../../class/listing.php';
class HighlightingreductionDisplayModuleFrontController extends ModuleFrontController
{

    public function initContent(){
        parent::initContent();
        $l = new Listing;
        $hr= new Highlightingreduction();
        //ProductSearchResult $result;
        $products=$hr->getProductsToDisplay();
        $variables="";
        $this->context->smarty->assign([
            'listing' => $variables,
        ]);
        $l->test(_PS_MODULE_DIR_ . 'highlightingreduction/views/templates/front/page.tpl', ['entity' => 'manufacturer', 'id' => 1]);
        //$this->template = _PS_MODULE_DIR_ . 'highlightingreduction/views/templates/front/page.tpl';

    }
}