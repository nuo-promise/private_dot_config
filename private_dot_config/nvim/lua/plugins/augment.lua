return {
  "augmentcode/augment.vim",
  event = "VeryLazy",
  config = function()
    -------------------------------------------------------------------
    -- 设置窗口参数：填满 tmux pane
    -------------------------------------------------------------------
    vim.g.augment_window_opts = {
      relative = "editor",
      row = 0,
      col = 0,
      width = vim.o.columns,
      height = vim.o.lines,
      border = "single",
    }

    -- 自动根据窗口 resize 调整
    vim.api.nvim_create_autocmd("VimResized", {
      callback = function()
        vim.g.augment_window_opts.width = vim.o.columns
        vim.g.augment_window_opts.height = vim.o.lines
      end,
    })

    -------------------------------------------------------------------
    -- 快捷键设置
    -------------------------------------------------------------------
    local map = vim.keymap.set
    local input = vim.ui.input

    -- 普通模式：ag 唤起 augment 输入
    map("n", "ag", function()
      input({ prompt = "Augment › " }, function(msg)
        if not msg or #msg == 0 then
          return
        end
        vim.cmd("Augment chat " .. vim.fn.shellescape(msg, true))
      end)
    end, { desc = "Augment: Ask question" })

    -- 可视模式：选中代码后 ag 发送上下文
    map("v", "ag", function()
      local ls = vim.fn.getpos("'<")[2]
      local le = vim.fn.getpos("'>")[2]
      local lines = vim.fn.getline(ls, le)
      local text = table.concat(lines, "\n")
      input({ prompt = "Augment › " }, function(msg)
        if not msg or #msg == 0 then
          return
        end
        local joined = text .. "\n\n" .. msg
        vim.cmd("Augment chat " .. vim.fn.shellescape(joined, true))
      end)
    end, { desc = "Augment: Ask with selection" })

    -- 查看 augment 状态
    map("n", "ts", ":Augment status<CR>", { desc = "Augment: Status", silent = true })
    map("n", "ai", ":Augment signin<CR>", { desc = "Augment: Sign in", silent = true })
    map("n", "ao", ":Augment signout<CR>", { desc = "Augment: Sign out", silent = true })
    map("n", "al", ":Augment log<CR>", { desc = "Augment: View log", silent = true })
    map("n", "an", ":Augment chat-new<CR>", { desc = "Augment: New chat", silent = true })
    map("n", "at", ":Augment chat-toggle<CR>", { desc = "Augment: Toggle chat", silent = true })
    map("n", "aq", ":Augment chat-toggle<CR>", { desc = "Augment: Close chat", silent = true })
  end,
}
