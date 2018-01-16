module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def json_response_data(object, status = :ok, meta = nil)
    json_response({"data" => object, "meta" => meta}, status)
  end
end
