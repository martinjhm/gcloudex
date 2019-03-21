defmodule GCloudex do

  @moduledoc """
  Set of wrappers for Google Cloud Platform's services API's.
  """

  @doc """
  Returns the Google Project ID specified in the creds.json file in the configs.
  """
  @spec get_project_id :: binary
  def get_project_id do
    credentials =
      :goth
      |> Application.get_env(:json) 
      |> Poison.decode!

    # Es un hack temporal, se obtiene las credenciales del proyecto principal
    case credentials do
      credentials when is_map(credentials) -> 
        Map.get("project_id")
      credentials when is_list(credentials) -> 
        credentials
        |> List.firts()
        |> Map.get("project_id")
    end
  end
end