class BOSHSession

  attr_reader :jid, :id, :random_id

  class << self
    def initialize_session(jid)
      new(jid).connect
    end
  end

  def initialize(jid)
    @jid = jid
    @service_url = Rails.application.secrets.bosh["service_url"]
    @id = @random_id = nil
  end

  def connect
    # @TODO make password configurable
    @jid, @id, @random_id = RubyBOSH.initialize_session(
      @jid, "password", @service_url)
    self
  end
end
