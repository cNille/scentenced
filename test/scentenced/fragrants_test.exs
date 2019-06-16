defmodule Scentenced.FragrantsTest do
  use Scentenced.DataCase

  alias Scentenced.Fragrants

  describe "fragrants" do
    alias Scentenced.Fragrants.Fragrant

    @valid_attrs %{blending_factor: 42, description: "some description", family: "some family", name: "some name", note: "some note"}
    @update_attrs %{blending_factor: 43, description: "some updated description", family: "some updated family", name: "some updated name", note: "some updated note"}
    @invalid_attrs %{blending_factor: nil, description: nil, family: nil, name: nil, note: nil}

    def fragrant_fixture(attrs \\ %{}) do
      {:ok, fragrant} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Fragrants.create_fragrant()

      fragrant
    end

    test "list_fragrants/0 returns all fragrants" do
      fragrant = fragrant_fixture()
      assert Fragrants.list_fragrants() == [fragrant]
    end

    test "get_fragrant!/1 returns the fragrant with given id" do
      fragrant = fragrant_fixture()
      assert Fragrants.get_fragrant!(fragrant.id) == fragrant
    end

    test "create_fragrant/1 with valid data creates a fragrant" do
      assert {:ok, %Fragrant{} = fragrant} = Fragrants.create_fragrant(@valid_attrs)
      assert fragrant.blending_factor == 42
      assert fragrant.description == "some description"
      assert fragrant.family == "some family"
      assert fragrant.name == "some name"
      assert fragrant.note == "some note"
    end

    test "create_fragrant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Fragrants.create_fragrant(@invalid_attrs)
    end

    test "update_fragrant/2 with valid data updates the fragrant" do
      fragrant = fragrant_fixture()
      assert {:ok, %Fragrant{} = fragrant} = Fragrants.update_fragrant(fragrant, @update_attrs)
      assert fragrant.blending_factor == 43
      assert fragrant.description == "some updated description"
      assert fragrant.family == "some updated family"
      assert fragrant.name == "some updated name"
      assert fragrant.note == "some updated note"
    end

    test "update_fragrant/2 with invalid data returns error changeset" do
      fragrant = fragrant_fixture()
      assert {:error, %Ecto.Changeset{}} = Fragrants.update_fragrant(fragrant, @invalid_attrs)
      assert fragrant == Fragrants.get_fragrant!(fragrant.id)
    end

    test "delete_fragrant/1 deletes the fragrant" do
      fragrant = fragrant_fixture()
      assert {:ok, %Fragrant{}} = Fragrants.delete_fragrant(fragrant)
      assert_raise Ecto.NoResultsError, fn -> Fragrants.get_fragrant!(fragrant.id) end
    end

    test "change_fragrant/1 returns a fragrant changeset" do
      fragrant = fragrant_fixture()
      assert %Ecto.Changeset{} = Fragrants.change_fragrant(fragrant)
    end
  end
end
