{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}
{extends file='catalog/listing/product-list.tpl'}

{block name='header_category_banner'}
    {if isset($listing) && $listing.pagination.items_shown_from == 1}
        {if !empty($category.image.large.url)}
            <div class="category-banner position-relative">
                <picture>
                    {if !empty($category.image.large.sources.avif)}<source srcset="{$category.image.large.sources.avif}" type="image/avif">{/if}
                    {if !empty($category.image.large.sources.webp)}<source srcset="{$category.image.large.sources.webp}" type="image/webp">{/if}
                    <img 
                        src="{$category.image.large.url}" 
                        alt="{if !empty($category.image.legend)}{$category.image.legend}{else}{$category.name}{/if}"
                        class="category-banner__img"
                        loading="eager"
                    >
                </picture>
            </div>
        {/if}
        
        <div class="category-title-bar">
            <div class="container">
                <h1 class="category-title-bar__text">
                    <span class="category-title-bar__icon"></span>
                    {$category.name}
                </h1>
            </div>
        </div>
    {elseif isset($category)}
        <div class="category-title-bar">
            <div class="container">
                <h1 class="category-title-bar__text">
                    {$category.name}
                    {l s='- page' d='Shop.Theme.Catalog'} {$listing.pagination.current_page}
                </h1>
            </div>
        </div>
    {/if}
{/block}

{block name='product_list_header'}
    {if $category.description}
        <div class="block-category mb-4">
            <div id="category-description" class="cms-content">{$category.description nofilter}</div>
        </div>
    {/if}
{/block}

{block name='product_list_footer'}
    {include file='catalog/_partials/category-footer.tpl' listing=$listing category=$category}
{/block}
