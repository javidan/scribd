Sequel.migration do
  up do
    create_table(:carts) do
      String :id
      String :user_id
      DateTime :created_at
      DateTime :updated_at
    end
  end

  down do
    drop_table(:carts)
  end
end
