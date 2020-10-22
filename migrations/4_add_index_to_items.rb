Sequel.migration do
  up do
    alter_table(:items) do
      add_index(:id)
      add_index(:product_id)
      add_index(:cart_id)
    end
  end

  down do
    alter_table(:items) do
      drop_index(:id)
      drop_index(:product_id)
      drop_index(:cart_id)
    end
  end
end
