UsersController.class_eval do
  def show
    @orders = @user.orders.complete.order('created_at DESC')
  end
end