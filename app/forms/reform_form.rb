class ReformForm < Reform::Form
  include Reform::Form::ActiveRecord

  def self.i18n_scope
    :activerecord
  end

  def self.human_attribute_name(attribute_key_name, options = {})
    I18n.t("activemodel.attributes.#{self.to_s.underscore}.#{attribute_key_name}", options)
  end

end
