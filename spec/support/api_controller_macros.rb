module ApiControllerMacros
  def json_response
    JSON.parse(response.body)
  end

  def json_error
    json_response['error']
  end
end
