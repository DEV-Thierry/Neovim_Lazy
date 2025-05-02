return {
  "mfussenegger/nvim-dap",
  optional = true,
  opts = function()
    local dap = require("dap")
    if not dap.adapters["netcoredbg"] then
      require("dap").adapters["netcoredbg"] = {
        type = "executable",
        command = "T:/netcoredbg/netcoredbg.exe",
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
          name = "Launch CapriSGR (Dev on 5226)",
          request = "launch",

          -- Aponta direto pro seu binário
          program = "T:/Annexus/CAPRI-SGR/CapriSGR/CapriSGR/CapriSGR.Server/bin/Debug/net9.0/CapriSGR.Server.dll",

          -- porta e URLs
          args = { "--urls", "http://localhost:5226" },

          -- diretório de trabalho
          cwd = "T:/Annexus/CAPRI-SGR/CapriSGR/CapriSGR/CapriSGR.Server",

          -- variável de ambiente
          env = {
            ASPNETCORE_ENVIRONMENT = "Development",
          },

          stopAtEntry = false,
        },
      }
    end
  end,
}
