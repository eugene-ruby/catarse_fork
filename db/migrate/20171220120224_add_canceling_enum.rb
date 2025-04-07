class AddCancelingEnum < ActiveRecord::Migration[4.2]
  def change
    # for deploy on RDS run alter enum directly on console, since it can't be run inside a transaction
    # need to think of a better way to solve this
    if Rails.env.development?
      execute <<-SQL
      ALTER TYPE payment_service.subscription_status ADD VALUE 'canceling';
      SQL
    end
  end
end
