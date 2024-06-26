defmodule Buymeabeer.Accounts.User do
  @moduledoc """
  User schema defines the schema and changesets for all user related operations, validations
  and data filteration.
  """
  alias Buymeabeer.Beer.Order
  alias Buymeabeer.Pages.Page
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :password, :string, virtual: true, redact: true
    field :hashed_password, :string, redact: true

    timestamps(type: :utc_datetime)

    has_many :pages, Page
    has_many :orders, Order
  end

  @doc """
  A user changeset for registration.
  It validates both user email and password. The email must be valid and unique.
  The password field will be replaced by the hashed_password field.
  """
  def registration_changeset(user, attrs, opts \\ []) do
    user
    |> cast(attrs, [:email, :password])
    |> validate_email(opts)
    |> validate_password(opts)
  end

  defp validate_email(changeset, opts) do
    changeset
    |> validate_required([:email])
    |> maybe_unique_email(opts)
    |> update_change(:email, &String.downcase/1)
  end

  defp maybe_unique_email(changeset, opts) do
    if Keyword.get(opts, :validate_email, true) && changeset.valid? do
      changeset
      |> unsafe_validate_unique(:email, Buymeabeer.Repo)
      |> unique_constraint(:email)
    else
      changeset
    end
  end

  defp validate_password(changeset, opts) do
    changeset
    |> validate_required(:password)
    |> maybe_hash_password(opts)
  end

  defp maybe_hash_password(changeset, opts) do
    hash_password? = Keyword.get(opts, :hash_password, true)
    password = get_change(changeset, :password)

    if hash_password? && password && changeset.valid? do
      changeset
      |> validate_length(:password, min: 4, max: 10)
      |> put_change(:hashed_password, Bcrypt.hash_pwd_salt(password))
      |> delete_change(:password)
    else
      changeset
    end
  end

  @doc """
  It verifies the user input password with the db hashed password.
  """
  def valid_password?(%Buymeabeer.Accounts.User{hashed_password: hashed_password}, password)
      when is_binary(hashed_password) and byte_size(password) > 0 do
    Bcrypt.verify_pass(password, hashed_password)
  end

  def valid_password?(_, _) do
    Bcrypt.no_user_verify()
    false
  end
end
