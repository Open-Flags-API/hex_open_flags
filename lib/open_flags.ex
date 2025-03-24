defmodule OpenFlags do
  @moduledoc """
  A lightweight interface to access local SVG flags via file path.
  """

  @flag_dir Path.join(:code.priv_dir(:open_flags), "static/flags")

  @doc """
  Returns the full path to a given flag if it exists.

  ## Example
      iex> OpenFlags.get_path("usa", "arizona")
      {:ok, "/path/to/open_flags/priv/static/flags/usa/arizona.svg"}
  """
  def get_path(country, region) do
    path = Path.join([@flag_dir, country, region <> ".svg"])

    if File.exists?(path) do
      {:ok, path}
    else
      {:error, :not_found}
    end
  end

  defmodule OpenFlags do
    @moduledoc """
    Fetches static SVG flag files by country and region ISO.
    """

    @base_path Path.join(:code.priv_dir(:open_flags), "flags")

    @doc """
    Get raw SVG content by country and region.

    ## Example

        iex> OpenFlags.get_svg("usa", "arizona")
        {:ok, "<svg ...>...</svg>"}

    """
    def get_svg(country, region) do
      path = Path.join([@base_path, country, "#{region}.svg"])

      if File.exists?(path) do
        File.read(path)
      else
        {:error, :not_found}
      end
    end
  end


  @doc """
  Reads and returns the raw SVG contents of a flag.

  ## Example
      iex> OpenFlags.get_svg("canada", "ontario")
      {:ok, "<svg..."}
  """
  def get_svg(country, region) do
    with {:ok, path} <- get_path(country, region),
         {:ok, content} <- File.read(path) do
      {:ok, content}
    end
  end
end
