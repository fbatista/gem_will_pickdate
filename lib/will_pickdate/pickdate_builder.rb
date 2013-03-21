module PickdateHelper

  #FIXME: maybe use datetime_field instead of datetime_field to prevent clash with future versions of rails
  def datetime_field(object_name, method, options = {})
      InstanceTag.new(object_name, method, self, options.delete(:object)).to_datetime_field_tag(options)
  end

  class InstanceTag
    
    def to_datetime_field_tag(options = {})
      options = options.stringify_keys
      options = DEFAULT_FIELD_OPTIONS.merge(options)

      options["type"] = "datetime"
      options["value"] = options.fetch("value"){ value_before_type_cast(object).iso8601 }
      options["value"] &&= ERB::Util.html_escape(options["value"])
      add_default_name_and_id(options)
      tag("input", options)
    end
  end
end