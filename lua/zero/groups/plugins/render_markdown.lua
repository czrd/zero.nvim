local M = {}

function M.get(t, _opts)
  return {
    -- render-markdown.nvim
    RenderMarkdownH1 = { fg = t.green, bold = true },
    RenderMarkdownH2 = { fg = t.green, bold = true },
    RenderMarkdownH3 = { fg = t.green },
    RenderMarkdownH4 = { fg = t.green },
    RenderMarkdownH5 = { fg = t.green },
    RenderMarkdownH6 = { fg = t.green },
    RenderMarkdownH1Bg = { bg = t.diff_add },
    RenderMarkdownH2Bg = { bg = t.diff_add },
    RenderMarkdownH3Bg = { bg = t.diff_add },
    RenderMarkdownH4Bg = { bg = t.diff_add },
    RenderMarkdownH5Bg = { bg = t.diff_add },
    RenderMarkdownH6Bg = { bg = t.diff_add },
    RenderMarkdownBullet = { fg = t.green },
    RenderMarkdownCode = { bg = t.bg_float },
    RenderMarkdownCodeInline = { fg = t.gold, bg = t.bg_float },
    RenderMarkdownDash = { fg = t.border },
    RenderMarkdownLink = { fg = t.blue, underline = true },
    RenderMarkdownMath = { fg = t.teal },
    RenderMarkdownSign = { fg = t.fg_gutter },
    RenderMarkdownChecked = { fg = t.green },
    RenderMarkdownUnchecked = { fg = t.fg_gutter },
    RenderMarkdownTodo = { fg = t.gold },
    RenderMarkdownTableHead = { fg = t.green, bold = true },
    RenderMarkdownTableRow = { fg = t.fg },
    RenderMarkdownTableFill = { fg = t.border },
    RenderMarkdownQuote = { fg = t.comment, italic = true },
    RenderMarkdownError = { fg = t.red },
    RenderMarkdownWarn = { fg = t.warn },
    RenderMarkdownInfo = { fg = t.info },
    RenderMarkdownHint = { fg = t.hint },
    RenderMarkdownSuccess = { fg = t.ok },

    -- headlines.nvim
    Headline = { bg = t.diff_add },
    Headline1 = { fg = t.green, bg = t.diff_add, bold = true },
    Headline2 = { fg = t.green, bg = t.diff_add, bold = true },
    Headline3 = { fg = t.green, bg = t.diff_add },
    Headline4 = { fg = t.green, bg = t.diff_add },
    Headline5 = { fg = t.green, bg = t.diff_add },
    Headline6 = { fg = t.green, bg = t.diff_add },
    CodeBlock = { bg = t.bg_float },
    Dash = { fg = t.border, bold = true },
    Quote = { fg = t.comment, italic = true },
    DoubleDash = { fg = t.border },
  }
end

return M
