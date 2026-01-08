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
{block name='header_top_bar'}
    <div class="header-top-bar">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-12 col-md-6 header-top-bar__left">
                    {hook h='displayNav1'}
                </div>
                <div class="col-12 col-md-6 header-top-bar__right text-md-right">
                    <span class="header-top-bar__shipping">Envíos gratuitos por compras SUPERIORES a 50€</span>
                </div>
            </div>
        </div>
    </div>
{/block}

{block name='header_search'}
    <div class="header-search">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-12 col-md-3 d-none d-md-block header-search__logo-col">
                    <a href="{$urls.pages.index}" class="header-search__logo">
                        {images_block webpEnabled=$webpEnabled}
                            <img
                                    {if !empty($shop.logo_details)}
                                        src="{$shop.logo_details.src}"
                                        width="{$shop.logo_details.width}"
                                        height="{$shop.logo_details.height}"
                                    {else}
                                        src="{$shop.logo}"
                                    {/if}
                                    class="logo img-fluid"
                                    alt="{$shop.name} {l s='logo' d='Shop.Theme.Global'}">
                        {/images_block}
                    </a>
                </div>
                <div class="col-12 col-md-6 header-search__search-col">
                    {hook h='displayTop'}
                </div>
                <div class="col-12 col-md-3 d-flex justify-content-end header-search__icons-col">
                    <div class="header-search__icons">
                        {hook h='displayNav2'}
                    </div>
                </div>
            </div>
        </div>
    </div>
{/block}

{block name='header_nav'}
    <div class="header-nav-main">
        <div class="container">
            {hook h='displayNavFullWidth'}
        </div>
    </div>
{/block}

{block name='header_breadcrumb'}
    <div class="header-breadcrumb">
        <div class="container">
            {block name='breadcrumb'}
                {include file='_partials/breadcrumb.tpl'}
            {/block}
        </div>
    </div>
{/block}
