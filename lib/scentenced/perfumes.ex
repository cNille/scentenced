defmodule Scentenced.Perfumes do
  @moduledoc """
  The Perfumes context.
  """

  import Ecto.Query, warn: false
  alias Scentenced.Repo

  alias Scentenced.Perfumes.Perfume
  alias Scentenced.Perfumes.Fragrant

  @doc """
  Returns the list of perfumes.

  ## Examples

      iex> list_perfumes()
      [%Perfume{}, ...]

  """
  def list_perfumes do
    Repo.all(from f in Perfume, order_by: f.name )
  end

  @doc """
  Gets a single perfume.

  Raises `Ecto.NoResultsError` if the Perfume does not exist.

  ## Examples

      iex> get_perfume!(123)
      %Perfume{}

      iex> get_perfume!(456)
      ** (Ecto.NoResultsError)

  """
  def get_perfume!(id), do: Repo.get!(Perfume, id)

  @doc """
  Creates a perfume.

  ## Examples

      iex> create_perfume(%{field: value})
      {:ok, %Perfume{}}

      iex> create_perfume(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_perfume(attrs \\ %{}) do
    %Perfume{}
    |> Perfume.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a perfume.

  ## Examples

      iex> update_perfume(perfume, %{field: new_value})
      {:ok, %Perfume{}}

      iex> update_perfume(perfume, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_perfume(%Perfume{} = perfume, attrs) do
    perfume
    |> Perfume.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Perfume.

  ## Examples

      iex> delete_perfume(perfume)
      {:ok, %Perfume{}}

      iex> delete_perfume(perfume)
      {:error, %Ecto.Changeset{}}

  """
  def delete_perfume(%Perfume{} = perfume) do
    Repo.delete(perfume)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking perfume changes.

  ## Examples

      iex> change_perfume(perfume)
      %Ecto.Changeset{source: %Perfume{}}

  """
  def change_perfume(%Perfume{} = perfume) do
    Perfume.changeset(perfume, %{})
  end

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
