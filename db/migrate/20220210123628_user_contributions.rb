class UserContributions < ActiveRecord::Migration[7.0]
  def up
    execute "CREATE TABLE public.user_contributions (
      id integer GENERATED ALWAYS AS IDENTITY,
      user_id integer NOT NULL,
      contribution_id integer NOT NULL,
      balance integer,
      PRIMARY KEY (id),
      FOREIGN KEY (user_id) REFERENCES public.users(id),
      FOREIGN KEY (contribution_id) REFERENCES public.contributions(id)
  );
  "
  end

  def down
    execute 'DROP TABLE IF EXISTS user_contributions'
  end
end
