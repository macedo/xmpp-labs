module ApplicationHelper
  def alert(level, message=nil, &block)
    content_tag :div, class: "alert alert-#{level}", role: "alert" do
      block_given? ? yield : message
    end
  end
end
