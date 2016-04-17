class Api::SeriesController < ApiController
  def index
    @series = Series.page params[:page]

    respond_to do |format|
      format.json { render json: @series,
                    serializer: PaginatedSerializer,
                    each_serializer: SeriesSerializer }
    end
  end
end
