module DeleteHelper
  def delete(id, model, path)
    model.find(id).destroy
    redirect_to(controller: "#{path}", action: 'index')
  end
end
