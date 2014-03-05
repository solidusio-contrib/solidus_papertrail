Deface::Override.new( virtual_path: 'spree/admin/shared/_order_tabs',
                      name: 'shipment_history_menu',
                      insert_bottom: "[data-hook='admin_order_tabs']",
                      text: "
                        <li <%== 'class=\"active\"' if current == 'Shipment History' %>><%= link_to_with_icon 'icon-truck', Spree.t(:shipment_history), shipment_versions_admin_order_path(@order) %></li>
                      "

  )