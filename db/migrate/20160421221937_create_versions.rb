# frozen_string_literal: true

class CreateVersions < SolidusSupport::Migration[4.2]
  # The largest text column available in all supported RDBMS is
  # 1024^3 - 1 bytes, roughly one gibibyte.  We specify a size
  # so that MySQL will use `longtext` instead of `text`.  Otherwise,
  # when serializing very large objects, `text` might not be big enough.
  TEXT_BYTES = 1_073_741_823

  def change
    if !table_exists?(:spree_order_versions)
      create_table :spree_order_versions do |t|
        t.string   :item_type, null: false
        t.integer  :item_id,   null: false
        t.string   :event,     null: false
        t.string   :whodunnit
        t.text     :object, limit: TEXT_BYTES
        t.text     :object_changes, limit: TEXT_BYTES
        t.datetime :created_at
      end
      add_index :spree_order_versions, [:item_type, :item_id]
    end

    if !table_exists?(:spree_payment_versions)
      create_table :spree_payment_versions do |t|
        t.string   :item_type, null: false
        t.integer  :item_id,   null: false
        t.string   :event,     null: false
        t.string   :whodunnit
        t.text     :object, limit: TEXT_BYTES
        t.text     :object_changes, limit: TEXT_BYTES
        t.datetime :created_at
      end
      add_index :spree_payment_versions, [:item_type, :item_id]
    end

    if !table_exists?(:spree_shipment_versions)
      create_table :spree_shipment_versions do |t|
        t.string   :item_type, null: false
        t.integer  :item_id,   null: false
        t.string   :event,     null: false
        t.string   :whodunnit
        t.text     :object, limit: TEXT_BYTES
        t.text     :object_changes, limit: TEXT_BYTES
        t.datetime :created_at
      end
      add_index :spree_shipment_versions, [:item_type, :item_id]
    end

    if !table_exists?(:spree_return_authorization_versions)
      create_table :spree_return_authorization_versions do |t|
        t.string   :item_type, null: false
        t.integer  :item_id,   null: false
        t.string   :event,     null: false
        t.string   :whodunnit
        t.text     :object, limit: TEXT_BYTES
        t.text     :object_changes, limit: TEXT_BYTES
        t.datetime :created_at
      end
      add_index :spree_return_authorization_versions, [:item_type, :item_id], name: 'spree_return_auth_versions'
    end

    if !table_exists?(:spree_line_item_versions)
      create_table :spree_line_item_versions do |t|
        t.string   :item_type, null: false
        t.integer  :item_id,   null: false
        t.string   :event,     null: false
        t.string   :whodunnit
        t.text     :object, limit: TEXT_BYTES
        t.text     :object_changes, limit: TEXT_BYTES
        t.datetime :created_at
      end
      add_index :spree_line_item_versions, [:item_type, :item_id]
    end

    if !table_exists?(:spree_adjustment_versions)
      create_table :spree_adjustment_versions do |t|
        t.string   :item_type, null: false
        t.integer  :item_id,   null: false
        t.string   :event,     null: false
        t.string   :whodunnit
        t.text     :object, limit: TEXT_BYTES
        t.text     :object_changes, limit: TEXT_BYTES
        t.datetime :created_at
      end
      add_index :spree_adjustment_versions, [:item_type, :item_id]
    end
  end
end
