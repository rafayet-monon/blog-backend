# frozen_string_literal: true

module Response

  def json_response(data = nil, status = :ok, template: nil)
    return render 'api/no_content' unless data.present?
    return render 'api/error', status: :unprocessable_entity, locals: { data: data } unless status == :ok
    return render template, locals: { data: data } if template.present?

    render 'api/success', locals: { data: data }
  end

end