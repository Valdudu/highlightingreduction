<?php
class Listing extends ProductListingFrontControllerCore{
    public function getListingLabel(){

     }

     public function test($param, $arr){
         $this->doProductSearch($param, $arr);
     }
    /**
     * Gets the product search query for the controller.
     * That is, the minimum contract with which search modules
     * must comply.
     *
     * @return ProductSearchQuery
     */
    protected function getProductSearchQuery(){

     }

    /**
     * We cannot assume that modules will handle the query,
     * so we need a default implementation for the search provider.
     *
     * @return ProductSearchProviderInterface
     */
    protected function getDefaultProductSearchProvider(){

    }
}