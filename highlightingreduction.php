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
        Configuration::updateValue('HIGHLIGHTINGREDUCTION_SLIDER_PRODUCT_PER_ROW', 1);
        Configuration::updateValue('HIGHLIGHTINGREDUCTION_SLIDER_PRODUCT_ROW', 0);
        Configuration::updateValue('HIGHLIGHTINGREDUCTION_SLIDER_PRODUCT_NUMBER', 0);
        Configuration::updateValue('HIGHLIGHTINGREDUCTION_SLIDER_HOURS', 0);
        
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
        /* Place your code here. */
    }    
    public function hookDisplayFooter()
    {
        /* Place your code here. */
    }
    public function hookDisplayFooterBefore()
    {
        /* Place your code here. */
    }    
}
