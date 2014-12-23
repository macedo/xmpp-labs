class JabberRegisterUserWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)
    JabberUser.new(user.username).register!
    user.update_attributes(registered_on_jabber: true)
  end
end
