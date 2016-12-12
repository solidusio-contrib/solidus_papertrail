Spree::User.class_eval do
  def full_name
    "#{first_name} #{last_name}"
  end
end
