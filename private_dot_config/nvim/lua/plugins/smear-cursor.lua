return {
  "sphamba/smear-cursor.nvim",
  event = "VeryLazy",
  opts = {
    -- 在缓冲区/窗口切换时显示拖尾
    smear_between_buffers = true,
    -- 在行内或相邻行移动时显示拖尾
    smear_between_neighbor_lines = true,
    -- 滚动时在缓冲区空间绘制拖尾
    scroll_buffer_space = true,
    -- 透明背景适配（你的主题是透明背景）
    legacy_computing_symbols_support = false,
    -- 插入模式也显示拖尾
    smear_insert_mode = true,
    -- 透明背景的回退颜色
    transparent_bg_fallback_color = "#303030",
  },
  keys = {
    { "<leader>us", "<cmd>SmearCursorToggle<cr>", desc = "Toggle Smear Cursor" },
  },
}
