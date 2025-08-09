class HealthController < ApplicationController
  def check
    begin
      ActiveRecord::Base.connection.execute("SELECT 1")
      pg_connected = true
    rescue => e
      pg_connected = false
    end

    if pg_connected
      render json: { status: "ok", pg: "connected" }, status: 200
    else
      render json: {
        status: "error",
        pg: pg_connected ? "connected" : "disconnected"
      }, status: 404
    end
  end
end
