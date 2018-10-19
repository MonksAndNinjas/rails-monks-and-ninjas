module SVGHelper

  private
  # reads the edit-icon file format -- svg
  def show_svg(path)
    File.open("app/assets/images/#{path}", "rb") do |file|
      raw file.read
    end
  end
end
