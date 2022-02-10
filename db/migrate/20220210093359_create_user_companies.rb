class CreateUserCompanies < ActiveRecord::Migration[7.0]
  def up
    execute "CREATE TABLE public.user_companies (
      id integer GENERATED ALWAYS AS IDENTITY,
      company_id integer NOT NULL,
      user_id integer NOT NULL,
      PRIMARY KEY (id),
      FOREIGN KEY (company_id) REFERENCES public.companies(id),
      FOREIGN KEY (user_id) REFERENCES public.users(id)
  );
  "
  end

  def down
    execute 'DROP TABLE IF EXISTS user_companies'
  end
end
