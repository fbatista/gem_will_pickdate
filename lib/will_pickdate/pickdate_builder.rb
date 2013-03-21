module PickdateHelper
  def datetime_field(object_name, method, options = {})
    InstanceTag.new(object_name, method, self, options.delete(:object)).to_datetime_field_tag(options)
  end
end

module PickdateHelperInstanceTag
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

class ActionView::Helpers::InstanceTag
  include PickdateHelperInstanceTag
end

class ActionView::Helpers::FormBuilder
  def datetime_field(method, options = {})
    @template.datetime_select(@object_name, method, objectify_options(options))
  end
end