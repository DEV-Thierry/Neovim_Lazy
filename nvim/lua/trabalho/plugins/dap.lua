return {
  "mfussenegger/nvim-dap",
  optional = true,
  opts = function()
    local dap = require("dap")
    if not dap.adapters["netcoredbg"] then
      require("dap").adapters["netcoredbg"] = {
        type = "executable",
        command = "/usr/local/netcoredbg",
        args = { "--interpreter=vscode" },
        options = {
          detached = false,
        },
      }
    end
    for _, lang in ipairs({ "cs", "fsharp", "vb" }) do
      dap.configurations[lang] = {
        {
          type = "netcoredbg",
          name = "launch caprisgr (dev on 5226)",
          request = "launch",

          program = function()
            return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/net9.0", "file")
          end,
          -- program = "annexus/caprisgr/caprisgr/caprisgr.server/bin/debug/net9.0/caprisgr.server.dll",
          -- program = "/mnt/t/annexus/capri-sgr/caprisgr/caprisgr/caprisgr.server/bin/debug/net9.0/caprisgr.server.dll",

          -- porta e urls
          args = { "--urls", "http://localhost:5226" },

          -- diretório de trabalho
          cwd = "t:/annexus/capri-sgr/caprisgr/caprisgr/caprisgr.server",

          -- variável de ambiente
          env = {
            aspnetcore_environment = "development",
          },

          stopatentry = false,
        },
        {
          type = "netcoredbg",
          name = "launch caprisgr (dev on 8080)",
          request = "launch",

          program = function()
            return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/net9.0", "file")
          end,
          -- program = "annexus/caprisgr/caprisgr/caprisgr.server/bin/debug/net9.0/caprisgr.server.dll",
          -- program = "/mnt/t/annexus/capri-sgr/caprisgr/caprisgr/caprisgr.server/bin/debug/net9.0/caprisgr.server.dll",

          -- porta e urls
          args = { "--urls", "http://localhost:8080" },

          -- diretório de trabalho
          cwd = "t:/annexus/capri-sgr/caprisgr/caprisgr/caprisgr.server",

          -- variável de ambiente
          env = {
            aspnetcore_environment = "development",
          },

          stopatentry = false,
        },
      }
    end
  end,
}
