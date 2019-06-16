defmodule ScentencedWeb.FragrantControllerTest do
  use ScentencedWeb.ConnCase

  alias Scentenced.Fragrants

  @create_attrs %{blending_factor: 42, description: "some description", family: "some family", name: "some name", note: "some note"}
  @update_attrs %{blending_factor: 43, description: "some updated description", family: "some updated family", name: "some updated name", note: "some updated note"}
  @invalid_attrs %{blending_factor: nil, description: nil, family: nil, name: nil, note: nil}

  def fixture(:fragrant) do
    {:ok, fragrant} = Fragrants.create_fragrant(@create_attrs)
    fragrant
  end

  describe "index" do
    test "lists all fragrants", %{conn: conn} do
      conn = get(conn, Routes.fragrant_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Fragrants"
    end
  end

  describe "new fragrant" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.fragrant_path(conn, :new))
      assert html_response(conn, 200) =~ "New Fragrant"
    end
  end

  describe "create fragrant" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.fragrant_path(conn, :create), fragrant: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.fragrant_path(conn, :show, id)

      conn = get(conn, Routes.fragrant_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Fragrant"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.fragrant_path(conn, :create), fragrant: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Fragrant"
    end
  end

  describe "edit fragrant" do
    setup [:create_fragrant]

    test "renders form for editing chosen fragrant", %{conn: conn, fragrant: fragrant} do
      conn = get(conn, Routes.fragrant_path(conn, :edit, fragrant))
      assert html_response(conn, 200) =~ "Edit Fragrant"
    end
  end

  describe "update fragrant" do
    setup [:create_fragrant]

    test "redirects when data is valid", %{conn: conn, fragrant: fragrant} do
      conn = put(conn, Routes.fragrant_path(conn, :update, fragrant), fragrant: @update_attrs)
      assert redirected_to(conn) == Routes.fragrant_path(conn, :show, fragrant)

      conn = get(conn, Routes.fragrant_path(conn, :show, fragrant))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, fragrant: fragrant} do
      conn = put(conn, Routes.fragrant_path(conn, :update, fragrant), fragrant: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Fragrant"
    end
  end

  describe "delete fragrant" do
    setup [:create_fragrant]

    test "deletes chosen fragrant", %{conn: conn, fragrant: fragrant} do
      conn = delete(conn, Routes.fragrant_path(conn, :delete, fragrant))
      assert redirected_to(conn) == Routes.fragrant_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.fragrant_path(conn, :show, fragrant))
      end
    end
  end

  defp create_fragrant(_) do
    fragrant = fixture(:fragrant)
    {:ok, fragrant: fragrant}
  end
end
