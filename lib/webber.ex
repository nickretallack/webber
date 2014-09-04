defmodule Webber do
  use Application # call Application.__using__ macro which add the @behaviour :application and default implementation of the stop function
  # start function has to start the process supervision tree
  def start(_type, _args), do: Webber.Sup.start_link

  # Hyperweb.Sup is here defined as a nested module
  defmodule Sup do
    use Supervisor # call Supervisor.__using__ macro which add the @behaviour :supervisor and supervise/supervisor/worker functions to easily define child spec.
    def start_link, do: Supervisor.start_link(__MODULE__,[]) # start a linked supervisor with current module Hyperweb.Sup as a callback, which is possible because it implement the supervisor behaviour and so the init/1 function.
    def init([]) do # init should return {:ok,{{restartStrategy,maxR,maxT},[childSpec]}}, the supervise/supervisor/worker functions help you to define easily this specification
      supervise([
        supervisor(Ewebmachine.Sup,[[modules: [WebMain],port: 8080]])
      ], strategy: :one_for_one)
    end
  end

  ## This is the default contents of this file:
  # # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # # for more information on OTP Applications
  # def start(_type, _args) do
  #   import Supervisor.Spec, warn: false

  #   children = [
  #     # Define workers and child supervisors to be supervised
  #     # worker(Webber.Worker, [arg1, arg2, arg3])
  #   ]

  #   # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
  #   # for other strategies and supported options
  #   opts = [strategy: :one_for_one, name: Webber.Supervisor]
  #   Supervisor.start_link(children, opts)
  # end
end
