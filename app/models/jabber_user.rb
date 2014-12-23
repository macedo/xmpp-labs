class JabberUser
  def initialize(username)
    @jid = Jabber::JID.new(
      "#{username}@#{Rails.application.secrets.xmpp["server"]}")
  end

  def bareJID
    @jid.to_s.split('/').first
  end

  def register!
    client.connect

    # @TODO make password configurable
    client.register('password')
  end

  private

  def client
    @client ||= Jabber::Client.new(@jid)
  end
end
