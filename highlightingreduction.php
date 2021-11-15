<?php
/**
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
*/
use PrestaShop\PrestaShop\Core\Product\ProductListingPresenter;
use PrestaShop\PrestaShop\Adapter\Image\ImageRetriever;
use PrestaShop\PrestaShop\Adapter\Product\PriceFormatter;
use PrestaShop\PrestaShop\Adapter\Product\ProductColorsRetriever;

if (!defined('_PS_VERSION_')) {
    exit;
}

class Highlightingreduction extends Module
{
    protected $config_form = false;

    public function __construct()
    {
        $this->name = 'highlightingreduction';
        $this->tab = 'pricing_promotion';
        $this->version = '1.0.0';
        $this->author = 'Valentin Duplan';
        $this->need_instance = 0;

        /**
         * Set $this->bootstrap to true if your module is compliant with bootstrap (PrestaShop 1.6)
         */
        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->l('Display your flash discounts and reductions');
        $this->description = $this->l('Improve your sales by highlighting your discounts and flash promotions on your home page and others. Create a page displaying all your promotions');

        $this->ps_versions_compliancy = array('min' => '1.7', 'max' => _PS_VERSION_);
    }

    /**
     * Don't forget to create update methods if needed:
     * http://doc.prestashop.com/display/PS16/Enabling+the+Auto-Update
     */
    public function install()
    {
        /**GENERAL TAB DATA**/
        //object
        Configuration::updateValue('HIGHLIGHTINGREDUCTION_OBJECT', 1);
        Configuration::updateValue('HIGHLIGHTINGREDUCTION_ACTIVE_PRODUCT_PAGE', 0);
        Configuration::updateValue('HIGHLIGHTINGREDUCTION_PRODUCT_PAGE_POSITION', 0);
        Configuration::updateValue('HIGHLIGHTINGREDUCTION_ACTIVE_CATEGORY_PAGE', 0);
        
        /**SLIDER TAB DATA**/
        //page with all product with a reduction
        Configuration::updateValue('HIGHLIGHTINGREDUCTION_ACTIVATE_SLIDER', 0);
        Configuration::updateValue('HIGHLIGHTINGREDUCTION_SLIDER_HOOK_POSITION', 0);
        Configuration::updateValue('HIGHLIGHTINGREDUCTION_SLIDER_PRODUCT_PER_ROW', 4);
        Configuration::updateValue('HIGHLIGHTINGREDUCTION_SLIDER_PRODUCT_ROW', 1);
        Configuration::updateValue('HIGHLIGHTINGREDUCTION_SLIDER_PRODUCT_NUMBER', 0);
        Configuration::updateValue('HIGHLIGHTINGREDUCTION_SLIDER_HOURS', 0);
        Configuration::updateValue('HIGHLIGHTINGREDUCTION_SLIDER_HOURS_INTERVAL', "DAY");
        Configuration::updateValue('HIGHLIGHTINGREDUCITON_SLIDER_ORDER_BY','0');
        Configuration::updateValue('HIGHLIGHTLINGREDUCTION_SLIDER_ORDER_WAY','ASC');
        
        /**PRODUCT LIST TAB DATA**/
        Configuration::updateValue('HIGHLIGHTINGREDUCTION_ACTIVATE_PAGE', 0);
        Configuration::updateValue('HIGHLIGHTINGREDUCTION_DISCOUNT_HOURS', 0);

        return parent::install() &&
            $this->registerHook('displayHome')&&
            $this->registerHook('displayFooter')&&
            $this->registerHook('displayFooterBefore');
    }

    public function uninstall()
    {
        Configuration::deleteByName('HIGHLIGHTINGREDUCTION_OBJECT');
        Configuration::deleteByName('HIGHLIGHTINGREDUCTION_ACTIVE_PRODUCT_PAGE');
        Configuration::deleteByName('HIGHLIGHTINGREDUCTION_PRODUCT_PAGE_POSITION');
        Configuration::deleteByName('HIGHLIGHTINGREDUCTION_ACTIVE_CATEGORY_PAGE');
        
        /**SLIDER TAB DATA**/
        //page with all product with a reduction
        Configuration::deleteByName('HIGHLIGHTINGREDUCTION_ACTIVATE_SLIDER');
        Configuration::deleteByName('HIGHLIGHTINGREDUCTION_SLIDER_HOOK_POSITION');
        Configuration::deleteByName('HIGHLIGHTINGREDUCTION_SLIDER_PRODUCT_PER_ROW');
        Configuration::deleteByName('HIGHLIGHTINGREDUCTION_SLIDER_PRODUCT_ROW');
        Configuration::deleteByName('HIGHLIGHTINGREDUCTION_SLIDER_PRODUCT_NUMBER');
        Configuration::deleteByName('HIGHLIGHTINGREDUCTION_SLIDER_HOURS');
        Configuration::deleteByName('HIGHLIGHTINGREDUCTION_SLIDER_HOURS_INTERVAL');
        Configuration::deleteByName('HIGHLIGHTINGREDUCTION_SLIDER_ORDER_BY');
        Configuration::deleteByName('HIGHLIGHTINGREDUCTION_SLIDER_ORDER_WAY');
        
        /**PRODUCT LIST TAB DATA**/
        Configuration::deleteByName('HIGHLIGHTINGREDUCTION_ACTIVATE_PAGE');
        Configuration::deleteByName('HIGHLIGHTINGREDUCTION_DISCOUNT_HOURS');
        return parent::uninstall();
    }

    /**
     * Load the configuration form
     */
    public function getContent()
    {
        if(Tools::isSubmit('saveconfiguration')){
            $this->postProcessGeneral();
        }
        if(Tools::isSubmit('saveslider')){
            $this->postProcessSlider();
        }
        if(Tools::isSubmit('savelist')){
            $this->postProcessDiscountPage();
        }
        dump(Configuration::get('HIGHLIGHTINGREDUCTION_SLIDER_ORDER_BY'));
        dump(Configuration::get('HIGHLIGHTINGREDUCTION_SLIDER_ORDER_WAY'));
        dump(Configuration::get('HIGHLIGHTINGREDUCTION_SLIDER_HOURS_INTERVAL'));
        $this->context->controller->addCSS($this->_path.'views/css/back.css');
        $this->context->controller->addJS($this->_path.'views/js/back.js');
        $this->context->smarty->assign([
            'object' =>Configuration::get('HIGHLIGHTINGREDUCTION_OBJECT'),
            'product_page' =>Configuration::get('HIGHLIGHTINGREDUCTION_ACTIVE_PRODUCT_PAGE'),
            'product_page_position' =>Configuration::get('HIGHLIGHTINGREDUCTION_PRODUCT_PAGE_POSITION'),
            'category_page' =>Configuration::get('HIGHLIGHTINGREDUCTION_ACTIVE_CATEGORY_PAGE'),
            'slider_activate' =>Configuration::get('HIGHLIGHTINGREDUCTION_ACTIVATE_SLIDER'),

            'slider_hook_position' =>Configuration::get('HIGHLIGHTINGREDUCTION_SLIDER_HOOK_POSITION'),
            'slider_product_per_row' =>Configuration::get('HIGHLIGHTINGREDUCTION_SLIDER_PRODUCT_PER_ROW'),
            'slider_product_row' =>Configuration::get('HIGHLIGHTINGREDUCTION_SLIDER_PRODUCT_ROW'),
            'slider_number_to_display' =>Configuration::get('HIGHLIGHTINGREDUCTION_SLIDER_PRODUCT_NUMBER'),
            'slider_discount_end' =>Configuration::get('HIGHLIGHTINGREDUCTION_SLIDER_HOURS'),
            'SLIDER_ORDER_BY' => Configuration::get('HIGHLIGHTINGREDUCTION_SLIDER_ORDER_BY'),
            'SLIDER_ORDER_WAY' => Configuration::get('HIGHLIGHTINGREDUCTION_SLIDER_ORDER_WAY'),
            'SLIDER_DISCOUNT_END_INTERVAL' => Configuration::get('HIGHLIGHTINGREDUCTION_SLIDER_HOURS_INTERVAL'),

            'page_activate' =>Configuration::get('HIGHLIGHTINGREDUCTION_ACTIVATE_PAGE'),
            'page_discount_end' =>Configuration::get('HIGHLIGHTINGREDUCTION_DISCOUNT_HOURS'),
            
        ]);

        return $this->display(__FILE__, 'views/templates/admin/configure.tpl');
    }


    /**
     * Save form data.
     */
    protected function postProcessGeneral()
    {
        Configuration::updateValue('HIGHLIGHTINGREDUCTION_OBJECT', Tools::getValue('object_style'));
        Configuration::updateValue('HIGHLIGHTINGREDUCTION_ACTIVE_PRODUCT_PAGE', Tools::getValue('ACTIVATE_PRODUCT_PAGE'));
        Configuration::updateValue('HIGHLIGHTINGREDUCTION_PRODUCT_PAGE_POSITION', Tools::getValue('PRODUCT_PAGE_POSITION'));
        Configuration::updateValue('HIGHLIGHTINGREDUCTION_ACTIVE_CATEGORY_PAGE', Tools::getValue('ACTIVATE_CATEGORY_LIST'));
    }
    /**
     * Save form data.
     */
    protected function postProcessSlider()
    {
        Configuration::updateValue('HIGHLIGHTINGREDUCTION_ACTIVATE_SLIDER', Tools::getValue('ACTIVATE_SLIDER'));
        Configuration::updateValue('HIGHLIGHTINGREDUCTION_SLIDER_HOOK_POSITION', Tools::getValue('PRODUCT_SLIDER_POSITION'));
        Configuration::updateValue('HIGHLIGHTINGREDUCTION_SLIDER_PRODUCT_PER_ROW', Tools::getValue('PRODUCT_PER_ROW'));
        Configuration::updateValue('HIGHLIGHTINGREDUCTION_SLIDER_PRODUCT_ROW', Tools::getValue('ROW_NUMBER'));
        Configuration::updateValue('HIGHLIGHTINGREDUCTION_SLIDER_PRODUCT_NUMBER', intval(Tools::getValue('SLIDER_MAX_PRODUCT')));
        Configuration::updateValue('HIGHLIGHTINGREDUCTION_SLIDER_HOURS', intval(Tools::getValue('SLIDER_DISCOUNT_END')));
        Configuration::updateValue('HIGHLIGHTINGREDUCTION_SLIDER_ORDER_BY', Tools::getValue('SLIDER_ORDER_BY'));
        Configuration::updateValue('HIGHLIGHTINGREDUCTION_SLIDER_ORDER_WAY', Tools::getValue('SLIDER_ORDER_WAY'));
        Configuration::updateValue('HIGHLIGHTINGREDUCTION_SLIDER_HOURS_INTERVAL', Tools::getValue('SLIDER_DISCOUNT_END_INTERVAL'));


        
    }
    /**
     * Save form data.
     */
    protected function postProcessDiscountPage()
    {
        Configuration::updateValue('HIGHLIGHTINGREDUCTION_ACTIVATE_PAGE', Tools::getValue('ACTIVATE_DISCOUNT_PAGE'));
        Configuration::updateValue('HIGHLIGHTINGREDUCTION_DISCOUNT_HOURS', intval(Tools::getValue('PAGE_DISCOUNT_END')));

    }


    public function hookDisplayHome()
    {   
        return $this->displaySlider(0);

    }    
    public function hookDisplayFooter()
    {
        /* Place your code here. */
    }
    public function hookDisplayFooterBefore()
    {
        return $this->displaySlider(1);
    }     
    private function getProductsToDisplay($orderBy="", $orderWay="ASC", $limit=0, $time="0", $interval=""){
        $sql = 'SELECT p.*, product_shop.*, pl.* , m.`name` AS manufacturer_name, s.`name` AS supplier_name, IF(sp.reduction<1, ROUND(product_shop.price*(1+(t.rate/100))*sp.reduction, 2), sp.reduction) as red
        FROM `' . _DB_PREFIX_ . 'product` p
        ' . Shop::addSqlAssociation('product', 'p') . '
        LEFT JOIN `' . _DB_PREFIX_ . 'product_lang` pl ON (p.`id_product` = pl.`id_product` ' . Shop::addSqlRestrictionOnLang('pl') . ')
        LEFT JOIN `' . _DB_PREFIX_ . 'manufacturer` m ON (m.`id_manufacturer` = p.`id_manufacturer`)
        LEFT JOIN `' . _DB_PREFIX_ . 'supplier` s ON (s.`id_supplier` = p.`id_supplier`) 
        JOIN `' . _DB_PREFIX_ . 'specific_price` sp ON p.id_product=sp.id_product
        JOIN `' . _DB_PREFIX_ . 'tax_rule` tr ON product_shop.id_tax_rules_group=tr.id_tax_rules_group AND tr.id_country='.$this->context->country->id.'
        JOIN `' . _DB_PREFIX_ . 'tax` t ON t.id_tax=tr.id_tax
        WHERE pl.`id_lang` = ' . (int) $this->context->language->id.'
        AND product_shop.price != 0
        AND product_shop.`active` = 1
        AND product_shop.`visibility` IN ("both", "catalog")
        '.($this->context->customer->id ? ' AND sp.id_group IN(0,'.(int)$this->context->customer->id_default_group.')
        AND sp.id_customer IN(0,'.(int)$this->context->customer->id.')':' AND sp.id_group=0
        AND sp.id_customer=0').'
        AND sp.id_country IN(0, '.(int)$this->context->country->id.')
        AND sp.from<=now() 
        ' ;
        ($time != "0" ? $sql.='AND (sp.to!="0000-00-00 00:00:00" && sp.to<=TIMESTAMPADD('.$interval.', '.(int)$time.', now()))' : $sql.='AND( sp.to="0000-00-00 00:00:00" || sp.to>=now())');
        //Display order variable has to have correct text
        /*  POSSIBILITIES
        * pl.name
        * product_shop.price
        * red
        *date fin
        */
        if($orderBy=="random"){
            $sql.=" ORDER BY RAND()";
        }
        elseif($orderBy=="date_fin"){
            $sql.=" ORDER BY IF(sp.to='0000-00-00 00:00:00',1,0) ".$orderWay;
        }
        elseif($orderBy!="0"){
            $sql .=" ORDER BY ".$orderBy." ".$orderWay;
        }
        //limits include start???
        $sql .=($limit > 0 ? " LIMIT ".$limit : "");
        echo $sql;

        $result = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($sql, true, false);

        if (!$result) {
            return [];
        }
        // Modify SQL result
        return $result;
        //return Product::getProductsProperties($idLang, $result);
    } 

    private function whereDisplaySlider($zone){
        if((int)Configuration::get('HIGHLIGHTINGREDUCTION_ACTIVATE_SLIDER')==1 && (int)Configuration::get('HIGHLIGHTINGREDUCTION_SLIDER_HOOK_POSITION')==$zone){
            return true;
        }else{
            return false;
        }
    }
    private function displaySlider($value){
        if($this->whereDisplaySlider($value)===true){
            $idLang=$this->context->language->id;
            $nb_product=(Configuration::get('HIGHLIGHTINGREDUCTION_SLIDER_PRODUCT_NUMBER')==0)? 60:Configuration::get('HIGHLIGHTINGREDUCTION_SLIDER_PRODUCT_NUMBER'); 
            $nb_par_page=(int)Configuration::get('HIGHLIGHTINGREDUCTION_SLIDER_PRODUCT_PER_ROW')*(int)Configuration::get('HIGHLIGHTINGREDUCTION_SLIDER_PRODUCT_ROW');
            //$nb_page=ceil($nb_product/$nb_par_page);
            //$products=$this->getProductsToDisplay("sp.to");
            $products = $this->getProductsToDisplay(
                Configuration::get('HIGHLIGHTINGREDUCTION_SLIDER_ORDER_BY'), 
                Configuration::get('HIGHLIGHTINGREDUCTION_SLIDER_ORDER_WAY'), 
                Configuration::get('HIGHLIGHTINGREDUCTION_SLIDER_PRODUCT_NUMBER'),
                Configuration::get('HIGHLIGHTINGREDUCTION_SLIDER_HOURS'),
                Configuration::get('HIGHLIGHTINGREDUCTION_SLIDER_HOURS_INTERVAL'),
            );
            $assembler = new ProductAssembler($this->context);

            $presenterFactory = new ProductPresenterFactory($this->context);
            $presentationSettings = $presenterFactory->getPresentationSettings();
            $presenter = new ProductListingPresenter(
                new ImageRetriever(
                    $this->context->link
                ),
                $this->context->link,
                new PriceFormatter(),
                new ProductColorsRetriever(),
                $this->context->getTranslator()
            );
    
            $products_for_template = array();
    
            foreach ($products as $rawProduct) {
                $products_for_template[] = $presenter->present(
                    $presentationSettings,
                    $assembler->assembleProduct($rawProduct),
                    $this->context->language
                );
            }
            $nb_page=(int)ceil(sizeof($products)/$nb_par_page);

            $this->context->controller->addCSS($this->_path.'views/css/front.css');
            $this->context->controller->addJS($this->_path.'views/js/front.js');
            $this->context->smarty->assign([
                'nbpage' => $nb_page,
                'nbproduct' => sizeof($products),
                'products' => $products_for_template,
                'nb_par_page' =>$nb_par_page,
            ]);
            dump($products_for_template);
            return $this->display(__FILE__, 'views/templates/front/hook/slider.tpl');
        }
    }
}
