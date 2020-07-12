class CustomErrorService
  attr_accessor :code, :detail, :title, :status, :serializer_source

  def initialize(source:, code:, detail: 'Something went wrong!', title:, status: 400)
    @serializer_source = source
    @code = code
    @status = status
    @detail = detail
    @title = title
  end
end