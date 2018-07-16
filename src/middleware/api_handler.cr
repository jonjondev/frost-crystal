class ApiHandler < Kemal::Handler
  def call(env)
    # Do something to affect all routes
    call_next env
  end
end
