defmodule Asada.Worker do
  use GenServer

  def start_link(state) do
    GenServer.start_link(__MODULE__, state)
  end

  @impl true
  def init({_, seconds} = state) do
    schedule(seconds)
    {:ok, state}
  end

  @impl true
  def handle_info(:tick, {message, seconds} = state) do
    schedule(seconds)
    IO.puts(message)
    {:noreply, state}
  end

  defp schedule(seconds) do
    Process.send_after(self(), :tick, :timer.seconds(seconds))
  end
end
