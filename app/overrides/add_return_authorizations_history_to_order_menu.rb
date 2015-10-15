Deface::Override.new( virtual_path: 'spree/admin/shared/_order_submenu',
                      name: 'return_authorization_history_menu',
                      insert_bottom: "[data-hook='admin_order_tabs']",
                      text: "
                        <li <%== 'class=\"active\"' if current == 'Return Authorization History' %>><%= link_to_with_icon 'icon-truck', Spree.t(:return_authorization_history), return_authorization_versions_admin_order_path(@order) %></li>
                      "

  )