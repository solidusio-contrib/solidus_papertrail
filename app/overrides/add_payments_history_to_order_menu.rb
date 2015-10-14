Deface::Override.new( virtual_path: 'spree/admin/shared/_order_submenu',
                      name: 'payment_history_menu',
                      insert_bottom: "[data-hook='admin_order_tabs']",
                      text: "
                        <li <%== 'class=\"active\"' if current == 'Payment History' %>><%= link_to_with_icon 'icon-money', Spree.t(:payment_history), payment_versions_admin_order_path(@order) %></li>
                      "

  )