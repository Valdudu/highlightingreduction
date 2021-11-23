	<div class="featured-products clearfix" style="">
		<h2 class="h2 products-section-title text-uppercase">{$title}</h2>
		<div id="myCarousel"  data-ride="carousel" data-interval="0"> 
			<!-- Wrapper for carousel items -->
			<div class="carousel-inner">
				<div class="mySlides fad">
					<div class="products row" itemscope="" itemtype="http://schema.org/ItemList">
					{foreach from=$products item=$product name=i}
						{if $smarty.foreach.i.iteration%$nb_par_page==0 && $smarty.foreach.i.iteration!=$nbproduct}
							{include file="catalog/_partials/miniatures/product.tpl" product=$product position=i}
							</div>
						</div>
						<div class="mySlides fad">
							<div class="products row" itemscope="" itemtype="http://schema.org/ItemList">
						{else}
							{include file="catalog/_partials/miniatures/product.tpl" product=$product}

						{/if}
					{/foreach}
					</div>
				</div>
			</div>
			<!-- Carousel controls -->
			<a class="carousel-control left" onclick="plusSlides(-1)">
				<i id="controlClick">&#10094;</i>
			</a>
			<a class="carousel-control right" onclick="plusSlides(1)">
				<i id="controlClick">&#10095;</i>
			</a>
			<div class="tt" style="text-align:center">
				{for $iteration=1 to $nbpage}
					<span class="dot" onclick="currentSlide({$iteration})"></span> 
				{/for}
			</div>
		</div>
	</div>
	
{if $style!=""}
<style>
.mySlides > .products > .product{
	{$style}
}
</style>
{/if}