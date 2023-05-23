module Features
  def have_success_flash
    have_css("[data-role=flash].notice-flash")
  end
end
