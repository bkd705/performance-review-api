defmodule Reviewster.EmployeeController do
  use Reviewster.Web, :controller
  alias Reviewster.{ErrorView, Repo, Employee}
  alias Plug.Conn

  def index(conn, _params) do
    employees = Repo.all(Employee)

    render(conn, "index.json", employees: employees)
  end

  def show(conn, %{"id" => uuid}) do
    with employee = %Employee{} <- Repo.get(Employee, uuid) do
      render(conn, "show.json", employee: employee)
    else
      nil ->
        conn
        |> Conn.put_status(404)
        |> render(ErrorView, "404.json", error: "Not Found")
    end
  end

  def create(conn, params) do
    changeset = Employee.changeset(%Employee{}, params)

    with {:ok, employee} <- Repo.insert(changeset) do
      conn
      |> Conn.put_status(201)
      |> render("show.json", employee: employee)
    else
      {:error, %{errors: errors}} ->
        conn
        |> put_status(422)
        |> render(ErrorView, "422.json", %{errors: errors})
    end
  end

  def update(conn, %{"id" => uuid} = params) do
    with employee = %Employee{} <- Repo.get(Employee, uuid),
      changeset = Employee.changeset(employee, params),
      {:ok, updated} <- Repo.update(changeset) do
        conn
        |> Conn.put_status(201)
        |> render("show.json", employee: updated)
    else
      nil ->
        conn
        |> put_status(422)
        |> render(ErrorView, "422.json", %{errors: ["Failed to find record"]})
      {:error, %{errors: errors}} ->
        conn
        |> put_status(422)
        |> render(ErrorView, "422.json", %{errors: errors})
    end
  end

  def delete(conn, %{"id" => uuid}) do
    with employee = %Employee{} <- Repo.get(Employee, uuid) do
      Repo.delete!(employee)
      conn
      |> Conn.put_status(201)
      |> Conn.send_resp(:no_content, "")
    else
      nil ->
        conn
        |> put_status(404)
        |> render(ErrorView, "404.json", error: "Not Found")
    end
  end
end