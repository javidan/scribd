Sequel.migration do
  up do
    alter_table(:carts) do
      add_index(:id)
      add_index(:user_id)
    end
  end

  down do
    alter_table(:carts) do
      drop_index(:id)
      drop_index(:user_id)
    end
  end
end
