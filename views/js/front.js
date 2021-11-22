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
*
* Don't forget to prefix your containers with your own identifier
* to avoid any conflicts with others containers.
*/

 if (typeof updateDisplay === 'function') {
  var updateDisplay_pspc_original = updateDisplay;
  updateDisplay = function () {
      updateDisplay_pspc_original();
      pspc_refreshProductTimers();
  }
} else {
  $('.pspc-combi-wrp:first').removeClass('pspc-cw-hide').fadeIn(100);
}

$(function () {
  pspc_initCountdown();

  $(document).on('click', '#grid', function(e){
      e.preventDefault();
      pspc_initCountdown('.psproductcountdown');
  });

  $(document).on('click', '#list', function(e){
      e.preventDefault();
      pspc_initCountdown('.psproductcountdown');
  });
});

function pspc_initCountdown(selector) {
  selector = (selector ? selector : '.pspc-inactive');
  $(selector).each(function(){
      var $pspc = $(this);
      var $pspc_container = $(this).parent('.pspc-wrp');
      $pspc_container = ($pspc_container.length ? $pspc_container : $pspc);

      // get "to" date
      var to = $pspc.data('to');
      if (typeof to === 'undefined' || !to) {
          return true;
      }
      // Check if "to" is a number or a string
      to = (isNaN(to) ? dateStringToTimestamp(to) : parseInt(to));

      $pspc.addClass('psproductcountdown').removeClass('pspc-inactive');
      var $pspc_main = $pspc.find('.pspc-main').clone();
      $pspc.html('');
      if ($pspc_main.length) {
          $pspc_main.appendTo($pspc);
      } else {
          $pspc.append('<div class="pspc-main" />');
      }
      $pspc_main = $pspc.find('.pspc-main');

      var now = +new Date();
      if (!to || (to < now && (pspc_hide_expired || pspc_hide_after_end))) {
          $pspc.hide();
          return true;
      }

      // adjust countdown position at the page
      if (pspc_adjust_positions) {
          var $parent = $pspc_container.parents('.product-prices:first');
          if (pspc_position_product === 'displayProductPriceBlock' && $parent.length) {
              $pspc_container.detach().appendTo($parent);
          } else if (pspc_position_list === 'over_img') {
              var $img = $pspc_container.parents('.product-miniature:first').find('img:first');
              $img = ($img.length ? $img : $pspc_container.parents('.ajax_block_product:first').find('img:first'));
              if ($img.length) {
                  $pspc_container.detach();
                  $img.after($pspc_container);
                  $pspc_container.parent().addClass('pspc-parent');
              }
          }
      }

      if (typeof pspc_callbackBeforeDisplay === 'function') {
          pspc_callbackBeforeDisplay($pspc, $pspc_container);
      }

      var tpl = pspc_countdown_tpl;
      var labels = pspc_labels,
          template = _.template(tpl);
      var currDate = '00:00:00:00';
      var nextDate = '00:00:00:00';

      // Build the layout
      var initData = pspc_strfobj(currDate);
      $pspc_main.find('.pspc-time').remove();
      labels.forEach(function(label, i) {
          $pspc_main.append(template({
              curr: initData[label],
              next: initData[label],
              label: label,
              label_lang: pspc_labels_lang[label]
          }));
      });
      // Start the countdown
      $pspc_main.pspccountdown(to, function(event) {
          var now = + new Date();
          var from = $pspc.data('from');

          if (to < now && pspc_hide_after_end) {
              $pspc.hide(400);
          } else if (from) {
              from = dateStringToTimestamp(from);
              if (now < from) {
                  $pspc.hide();
              } else {
                  $pspc.show(300);
              }
          }

          var data;
          var newDate = event.strftime('%D:%H:%M:%S');

          if (newDate !== nextDate) {
              currDate = nextDate;
              nextDate = newDate;
              // Setup the data
              data = {
                  'curr': pspc_strfobj(currDate),
                  'next': pspc_strfobj(nextDate)
              };
              // Apply the new values to each node that changed
              pspc_diff(data.curr, data.next).forEach(function(label) {
                  var selector = '.%s'.replace(/%s/, label),
                      $node = $pspc_main.find(selector);
                  // Update the node
                  $node.removeClass('flip hidden');
                  $node.find('.pspc-curr').text(data.curr[label]);
                  $node.find('.pspc-next').text(data.next[label]);
                  // Wait for a repaint to then flip
                  _.delay(function($node) {
                      $node.addClass('flip');
                  }, 50, $node);
              });
          }
      });
  });
}
if (typeof initCountdown === 'undefined') {
  var initCountdown = pspc_initCountdown;
}

// Parse countdown string to an object
function pspc_strfobj(str) {
  var pieces = str.split(':');
  var obj = {};
  pspc_labels.forEach(function(label, i) {
      obj[label] = pieces[i]
  });
  return obj;
}

// Return the time components that diffs
function pspc_diff(obj1, obj2) {
  var diff = [];
  pspc_labels.forEach(function(key) {
      if (obj1[key] !== obj2[key]) {
          diff.push(key);
      }
  });
  return diff;
}

function dateStringToTimestamp(dateString) {
  var dateTimeParts = dateString.split(' '),
      timeParts = dateTimeParts[1].split(':'),
      dateParts = dateTimeParts[0].split('-'),
      date;

  date = new Date(dateParts[0], parseInt(dateParts[1], 10) - 1, dateParts[2], timeParts[0], timeParts[1]);

  return date.getTime();
}

function pspc_refreshProductTimers() {
  var id_pa = $('#idCombination').val();
  $('.pspc-combi-wrp').hide().addClass('pspc-cw-hide');
  if (id_pa) {
      $('.pspc-cw-' + id_pa).removeClass('pspc-cw-hide').fadeIn(100);
  } else {
      $('.pspc-combi-wrp:first').removeClass('pspc-cw-hide').fadeIn(100);
  }
}

var pspc_countdown_tpl = '' +
  '<div class="pspc-time <%= label %> <%= label == pspc_highlight ? \'pspc-highlight\' : \'\' %>">' +
      '<span class="pspc-count pspc-curr pspc-top"><%= curr %></span>' +
      '<span class="pspc-count pspc-next pspc-top"><%= next %></span>' +
      '<span class="pspc-count pspc-next pspc-bottom"><%= next %></span>' +
      '<span class="pspc-count pspc-curr pspc-bottom"><%= curr %></span>' +
      '<span class="pspc-label"><%= label_lang %></span>' +
  '</div>';