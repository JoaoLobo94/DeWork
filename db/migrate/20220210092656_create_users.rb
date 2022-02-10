class CreateUsers < ActiveRecord::Migration[7.0]
  def up
    execute "CREATE TABLE public.users (
      id integer GENERATED ALWAYS AS IDENTITY,
      name varchar NOT NULL,
      public_key varchar NOT NULL,
      job varchar NOT NULL,
      created_at timestamp without time zone NOT NULL DEFAULT (now()),
      PRIMARY KEY (id)
  );"
  end
  def down
    execute "DROP TABLE IF EXISTS users"
  end
end
