require 'rails_helper'

RSpec.describe "kanbans/new", type: :view do
  before(:each) do
    assign(:kanban, Kanban.new())
  end

  it "renders new kanban form" do
    render

    assert_select "form[action=?][method=?]", kanbans_path, "post" do
    end
  end
end
