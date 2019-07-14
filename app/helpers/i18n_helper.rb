module I18nHelper
  def tm model, count: 2
    model = model.to_s.camelcase.constantize if model.is_a? String or model.is_a? Symbol

    model.model_name.human count: count
  end
end
