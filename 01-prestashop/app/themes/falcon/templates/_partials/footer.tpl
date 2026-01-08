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
<div class="footer-container">
  <div class="container">
    <div class="row footer-main">
      <div class="col-12 col-md-4 footer-contact">
        <div class="footer-contact__item">
          <i class="material-icons">phone</i>
          <span>+34 976 123 456</span>
        </div>
        <div class="footer-contact__item">
          <i class="material-icons">email</i>
          <span>info@dominio.com</span>
        </div>
        <div class="footer-contact__item">
          <i class="material-icons">location_on</i>
          <span>C/ Calle del cliente n° 45, 50011, Zaragoza</span>
        </div>
      </div>

      <div class="col-12 col-md-8 footer-links">
        <div class="row">
          <div class="col-12 col-md-4 footer-links__column">
            <h3 class="footer-links__title">{l s='MI CUENTA' d='Shop.Theme.Global'}</h3>
            <ul class="footer-links__list">
              {if $customer.is_logged}
                <li class="footer-links__item">
                  <a href="{$urls.pages.my_account}" class="footer-links__link">{l s='Mi cuenta' d='Shop.Theme.Customeraccount'}</a>
                </li>
              {else}
                <li class="footer-links__item">
                  <a href="{$urls.pages.authentication}" class="footer-links__link">{l s='Iniciar sesión' d='Shop.Theme.Customeraccount'}</a>
                </li>
                <li class="footer-links__item">
                  <a href="{$urls.pages.my_account}" class="footer-links__link">{l s='Mi cuenta' d='Shop.Theme.Customeraccount'}</a>
                </li>
              {/if}
            </ul>
          </div>

          <div class="col-12 col-md-4 footer-links__column">
            <h3 class="footer-links__title">{l s='INFORMACIÓN' d='Shop.Theme.Global'}</h3>
            <ul class="footer-links__list">
              <li class="footer-links__item">
                <a href="{$urls.pages.contact}" class="footer-links__link">{l s='Contacto' d='Shop.Theme.Global'}</a>
              </li>
              <li class="footer-links__item">
                <a href="{$urls.pages.stores}" class="footer-links__link">{l s='Sobre nosotros' d='Shop.Theme.Global'}</a>
              </li>
            </ul>
          </div>

          <div class="col-12 col-md-4 footer-links__column">
            <h3 class="footer-links__title">{l s='LEGAL' d='Shop.Theme.Global'}</h3>
            <ul class="footer-links__list">
              {if isset($cms_footer_links)}
                {foreach from=$cms_footer_links item=cms_footer_link}
                  <li class="footer-links__item">
                    <a href="{$cms_footer_link.url}" class="footer-links__link">{$cms_footer_link.title}</a>
                  </li>
                {/foreach}
              {else}
                <li class="footer-links__item">
                  <a href="#" class="footer-links__link">{l s='Aviso legal' d='Shop.Theme.Global'}</a>
                </li>
                <li class="footer-links__item">
                  <a href="#" class="footer-links__link">{l s='Condiciones de venta' d='Shop.Theme.Global'}</a>
                </li>
                <li class="footer-links__item">
                  <a href="#" class="footer-links__link">{l s='Política de privacidad' d='Shop.Theme.Global'}</a>
                </li>
                <li class="footer-links__item">
                  <a href="#" class="footer-links__link">{l s='Política de cookies' d='Shop.Theme.Global'}</a>
                </li>
              {/if}
            </ul>
          </div>
        </div>
      </div>
    </div>

    <div class="footer-divider"></div>

    <div class="footer-copyright">
      <p class="footer-copyright__text">
        {l s='Todos los derechos reservados' d='Shop.Theme.Global'} - {l s='Desarrollado por VGS' d='Shop.Theme.Global'}
      </p>
    </div>
  </div>
</div>
