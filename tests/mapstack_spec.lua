local find_map = function(maps, lhs)
  local maps = vim.api.nvim_get_keymap('n')
  for _, map in ipairs(maps) do
    if map.lhs == lhs then
      return map
    end
  end
end

describe("mapstack", function()
  it("can be required", function()
    require("stackmap")
  end)

  it("can push a single mapping", function()
    local rhs = "echo 'This is a test'"
    require("stackmap").push("test1", "n", {asdfasdf = rhs})

    local found = find_map("asdfasdf")
    assert.are.same(rhs, found.rhs)
  end)
end)
