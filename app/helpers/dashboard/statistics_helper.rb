module Dashboard::StatisticsHelper
  def link_helper_nil(object)
    if object.nil?
      "Unknown source"
    else
      link_to object, object, target: "_blank"
    end
  end
end
