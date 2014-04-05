module ApplicationHelper

  def bootstrap_flash(options = {})
    ret = []
    flash.each do |key, value|
      puts flash.inspect
      if key.to_s == 'alert'
        klass = "flash alert alert-danger global"
      else
        klass = "flash alert alert-#{key} global"
      end
      ret << content_tag( :div, {class: klass, id: "flash-#{key}"}) do
        content = haml_tag "a.close", "data-dismiss" => "alert" 
        haml_concat value
      end
    end
    return_string = ret.join("\n")
    return return_string.respond_to?(:html_safe) ? return_string.html_safe : return_string

  end
end
