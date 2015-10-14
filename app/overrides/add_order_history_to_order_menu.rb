Deface::Override.new( virtual_path: 'spree/admin/shared/_order_submenu',
                      name: 'order_history_menu',
                      insert_bottom: "[data-hook='admin_order_tabs']",
                      text: "
                        <li <%== 'class=\"active\"' if current == 'Order History' %>><%= link_to_with_icon 'icon-shopping-cart', Spree.t(:order_history), versions_admin_order_path(@order) %></li>
                      "

  )