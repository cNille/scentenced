defmodule ScentencedWeb.UserView do
  use ScentencedWeb, :view

  def render("user.json", %{user: user}) do
    %{id: user.id, email: user.email}
  end
end
