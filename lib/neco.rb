require 'neco/version'

class Neco
  def initialize(app)
    @app = app
  end

  def call(env)
    res = nil
    begin
      res = @app.call(env)
    rescue
      res = [500, { 'Content-Type' => 'text/html' }, { message: 'unexpected error' }.to_json]
    end
    res
  end
end
