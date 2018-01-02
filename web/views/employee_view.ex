defmodule Reviewster.EmployeeView do
  use Reviewster.Web, :view

  def render("index.json", %{employees: employees}) do
    render_many(employees, Reviewster.EmployeeView, "employee.json")
  end

  def render("show.json", %{employee: employee}) do
    render_one(employee, Reviewster.EmployeeView, "employee.json")
  end

  def render("employee.json", %{employee: employee}) do
    %{
      uuid: employee.uuid,
      first_name: employee.first_name,
      last_name: employee.last_name,
      email: employee.email,
      inserted_at: employee.inserted_at,
      updated_at: employee.updated_at
    }
  end
end