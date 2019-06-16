defmodule Scentenced.Fragrants do
  @moduledoc """
  The Fragrants context.
  """

  import Ecto.Query, warn: false
  alias Scentenced.Repo

  alias Scentenced.Fragrants.Fragrant

  @doc """
  Returns the list of fragrants.

  ## Examples

      iex> list_fragrants()
      [%Fragrant{}, ...]

  """
  def list_fragrants do
    Repo.all(from f in Fragrant, order_by: f.name )
  end

  @doc """
  Gets a single fragrant.

  Raises `Ecto.NoResultsError` if the Fragrant does not exist.

  ## Examples

      iex> get_fragrant!(123)
      %Fragrant{}

      iex> get_fragrant!(456)
      ** (Ecto.NoResultsError)

  """
  def get_fragrant!(id), do: Repo.get!(Fragrant, id)

  @doc """
  Creates a fragrant.

  ## Examples

      iex> create_fragrant(%{field: value})
      {:ok, %Fragrant{}}

      iex> create_fragrant(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_fragrant(attrs \\ %{}) do
    %Fragrant{}
    |> Fragrant.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a fragrant.

  ## Examples

      iex> update_fragrant(fragrant, %{field: new_value})
      {:ok, %Fragrant{}}

      iex> update_fragrant(fragrant, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_fragrant(%Fragrant{} = fragrant, attrs) do
    fragrant
    |> Fragrant.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Fragrant.

  ## Examples

      iex> delete_fragrant(fragrant)
      {:ok, %Fragrant{}}

      iex> delete_fragrant(fragrant)
      {:error, %Ecto.Changeset{}}

  """
  def delete_fragrant(%Fragrant{} = fragrant) do
    Repo.delete(fragrant)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking fragrant changes.

  ## Examples

      iex> change_fragrant(fragrant)
      %Ecto.Changeset{source: %Fragrant{}}

  """
  def change_fragrant(%Fragrant{} = fragrant) do
    Fragrant.changeset(fragrant, %{})
  end
end
