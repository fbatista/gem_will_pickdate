class ActionView::Base
  def datetime_field(object_name, method, options = {})
    InstanceTag.new(object_name, method, self, options.delete(:object)).to_datetime_field_tag(options)
  end
end

class ActionView::Helpers::InstanceTag
  def to_datetime_field_tag(options = {})
    options = options.stringify_keys
    options = DEFAULT_FIELD_OPTIONS.merge(options)

    options["type"] = "datetime"
    options["value"] = options.fetch("value"){ 
      v = value_before_type_cast(object)
      v.is_a?(Time) ? v.iso8601 : nil
    }
    options["value"] &&= ERB::Util.html_escape(options["value"])
    add_default_name_and_id(options)
    tag("input", options)
  end
end

class ActionView::Helpers::FormBuilder
  def datetime_field(method, options = {})
    @template.datetime_field(@object_name, method, objectify_options(options))
  end
end