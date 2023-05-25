defmodule Popcorn.Events.Event do
  use Ash.Resource, data_layer: AshPostgres.DataLayer

  postgres do
    table "events"
    repo Popcorn.Repo
  end

  code_interface do
    # defines the API this resource should be called from
    define_for Popcorn.Events
    # defining function Post.create/2 it calls the :create action
    define :create, action: :create
    # defining function Post.read_all/2 it calls the :read action
    define :read_all, action: :read
    # defining function Post.update/2 it calls the :update action
    define :update, action: :update
    # defining function Post.destroy/2 it calls the :destroy action
    define :destroy, action: :destroy
    # defining function Post.get_by_id/2
    # it calls the :by_id action with the argument :id
    define :get_by_id, args: [:id], action: :by_id
  end

  actions do
    defaults [:create, :read, :update, :destroy]

    read :by_id do
      argument :id, :uuid, allow_nil?: false
      get? true
      filter expr(id == ^arg(:id))
    end
  end

  attributes do
    uuid_primary_key :id

    attribute :title, :string do
      allow_nil? false
    end
  end
end
