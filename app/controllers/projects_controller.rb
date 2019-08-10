class ProjectsController < ApplicationController

  def index
    paginated = Project.recent.page(current_page).per(per_page)
    options = PaginationMetaGenerator.new(request: request, total_pages: paginated.total_pages).call
    render json: serializer.new(paginated, options)
  end

  def show
  end

  private

  def serializer
    ProjectSerializer
  end

  def current_page
    (params[:page] || 1).to_i
  end

  def per_page
    (params[:per_page] || 20).to_i
  end
end