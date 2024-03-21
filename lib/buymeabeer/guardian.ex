defmodule Buymeabeer.Guardian do
  use Guardian, otp_app: :buymeabeer

  def subject_for_token(user, _claims) do
    {:ok, to_string(user.id)}
  end

  def resource_from_claims(%{"sub" => id}) do
    user = Buymeabeer.Accounts.get_user!(id)
    {:ok, user}
  rescue
    Ecto.NoResultsError -> {:error, :resource_not_found}
  end

  def authenticate(email, password) do
    case Buymeabeer.Accounts.get_user_by_email_and_password(email, password) do
      nil ->
        {:error, :unauthorized}

      user ->
        create_token(user)
    end
  end

  def create_token(user) do
    {:ok, token, _full_claims} = encode_and_sign(user)
    {:ok, token}
  end
end
