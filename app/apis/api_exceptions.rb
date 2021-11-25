module ApiExceptions
  class APIExceptionError < RuntimeError; end

  class BadRequestError < APIExceptionError; end
  class UnauthorizedError < APIExceptionError; end
  class ForbiddenError < APIExceptionError; end
  class ApiRequestsQuotaReachedError < APIExceptionError; end
  class NotFoundError < APIExceptionError; end
  class UnprocessableEntityError < APIExceptionError; end
  class ApiError < APIExceptionError; end
end
