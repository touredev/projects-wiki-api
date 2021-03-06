class PaginationMetaGenerator
  DEFAULT_PAGE = 1
  DEFAULT_PER_PAGE = 20


  def initialize(request:, total_pages:)
    @url = request.base_url + request.path
    @page = request.params[:page].to_i
    @per_page = request.params[:per_page].to_i
    @total_pages = total_pages
    @hash = { is_collection: true, links: {}, meta: { current_page: page, total_pages: total_pages } }
  end

  def call
    if page > 1
      hash[:links][:first] = generate_url(1)
      hash[:links][:prev] = generate_url(page - 1)
    end
    hash[:links][:self] = generate_url(page)
    if page < total_pages
      hash[:links][:next] = generate_url(page + 1)
      hash[:links][:last] = generate_url(total_pages)
    end
    hash
  end

  private

  attr_reader :per_page, :page, :total_pages, :hash
  attr_accessor :url

  def generate_url(page)
    [url, url_params(page)].join('?')
  end

  def url_params(page)
    url_params = {}
    url_params[:per_page] = per_page if include_per_page?
    url_params[:page] = page if include_page?(page)
    url_params.to_query
  end

  def include_per_page?
    (per_page != 0) && (per_page != DEFAULT_PER_PAGE)
  end

  def include_page?(page)
    (page != 0) && (page != DEFAULT_PAGE)
  end
  
end