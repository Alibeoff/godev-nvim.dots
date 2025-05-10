return {
  "https://github.com/RomanVolkov/go.get.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  keys = function()
    return {
      {
        "sd",
        function()
          require("telescope").extensions.go_get.packages_search()
        end,
        desc = "[G]o [G]et packages",
      },
    }
  end,
}
