class CreateCompanies < ActiveRecord::Migration[7.0]
  def up
    execute "CREATE TABLE public.companies (
      id integer GENERATED ALWAYS AS IDENTITY,
      name varchar NOT NULL,
      github varchar NOT NULL,
      private_key varchar NOT NULL,
      balance integer,
      created_at timestamp without time zone NOT NULL DEFAULT (now()),
      PRIMARY KEY (id)
  );
  "
  end

  def down
    execute 'DROP TABLE IF EXISTS companies'
  end
end
