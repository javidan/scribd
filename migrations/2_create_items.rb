Sequel.migration do
  up do
    create_table(:items) do
      String :id
      Integer :product_id
      String :cart_id
      Integer :quantity
      DateTime :created_at
      DateTime :updated_at
    end
  end

  down do
    drop_table(:items)
  end
end
