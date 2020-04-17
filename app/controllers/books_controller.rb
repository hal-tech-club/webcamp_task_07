class BooksController < ApplicationController
  # books controller下は認証ガード保護有
  before_action :authenticate_user!
end
