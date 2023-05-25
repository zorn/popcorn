defmodule Popcorn.Events do
  use Ash.Api

  resources do
    registry Popcorn.Events.Registry
  end
end
