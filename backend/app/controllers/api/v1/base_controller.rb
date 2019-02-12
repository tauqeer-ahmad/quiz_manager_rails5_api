class Api::V1::BaseController < ApplicationController
  include Api::V1::ApiResponses
  include Api::V1::ApiExceptions
end
