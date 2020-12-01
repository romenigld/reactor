defmodule ReactorWeb.FooLive do
  use ReactorWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, msg: "none")
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <h1>Hello!</h1>
    <div phx-keydown="keydown"  phx-target="window">
      <%= @msg %>
    </div>
    """
  end

  def handle_event("keydown", %{"msg" => key}, socket) do
    socket = assign(socket, msg: key)
    {:noreply, socket}
  end
end
