module Features
  def fill(name, with:)
    full_name = "#{form_name}_#{name}"
    fill_in(full_name, with: with)
  end

  def submit_form
    find("input[type=submit][name=commit]").click
  end
end
