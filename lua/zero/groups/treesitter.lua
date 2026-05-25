local M = {}

function M.get(t, opts)
  local s = opts.styles or {}
  local kw = vim.tbl_extend("force", { fg = t.green }, s.keywords or {})
  local fn = vim.tbl_extend("force", { fg = t.blue }, s.functions or {})
  local var = vim.tbl_extend("force", { fg = t.fg }, s.variables or {})
  local cmt = vim.tbl_extend("force", { fg = t.comment }, s.comments or {})

  return {
    -- Keywords
    ["@keyword"] = kw,
    ["@keyword.import"] = kw,
    ["@keyword.return"] = kw,
    ["@keyword.repeat"] = kw,
    ["@keyword.conditional"] = kw,
    ["@keyword.conditional.ternary"] = { fg = t.teal },
    ["@keyword.exception"] = kw,
    ["@keyword.function"] = kw,
    ["@keyword.coroutine"] = kw,
    ["@keyword.operator"] = { fg = t.teal },
    ["@keyword.modifier"] = kw,
    ["@keyword.type"] = kw,
    ["@keyword.debug"] = kw,
    ["@keyword.directive"] = { fg = t.violet },
    ["@keyword.directive.define"] = { fg = t.violet },
    ["@label"] = { fg = t.green },

    -- Functions
    ["@function"] = fn,
    ["@function.call"] = fn,
    ["@function.method"] = fn,
    ["@function.method.call"] = fn,
    ["@function.builtin"] = { fg = t.violet },
    ["@function.macro"] = { fg = t.violet },

    -- Types / constructors
    ["@type"] = { fg = t.violet },
    ["@type.builtin"] = { fg = t.violet },
    ["@type.definition"] = { fg = t.violet },
    ["@type.qualifier"] = { fg = t.violet },
    ["@constructor"] = { fg = t.violet },

    -- Constants
    ["@constant"] = { fg = t.orange },
    ["@constant.builtin"] = { fg = t.orange },
    ["@constant.macro"] = { fg = t.violet },

    -- Strings
    ["@string"] = { fg = t.gold },
    ["@string.documentation"] = { fg = t.gold },
    ["@string.regexp"] = { fg = t.teal },
    ["@string.escape"] = { fg = t.orange },
    ["@string.special"] = { fg = t.orange },
    ["@string.special.symbol"] = { fg = t.gold },
    ["@string.special.url"] = { fg = t.teal, underline = true },
    ["@character"] = { fg = t.gold },
    ["@character.special"] = { fg = t.orange },

    -- Numbers / booleans
    ["@number"] = { fg = t.orange },
    ["@number.float"] = { fg = t.orange },
    ["@boolean"] = vim.tbl_extend("force", { fg = t.orange }, s.booleans or {}),

    -- Operators / punctuation
    ["@operator"] = { fg = t.teal },
    ["@punctuation.delimiter"] = { fg = t.fg_dim },
    ["@punctuation.bracket"] = { fg = t.fg_dim },
    ["@punctuation.special"] = { fg = t.teal },

    -- Variables
    ["@variable"] = var,
    ["@variable.builtin"] = { fg = t.fg, italic = true },
    ["@variable.parameter"] = var,
    ["@variable.parameter.builtin"] = { fg = t.fg, italic = true },
    ["@variable.member"] = var,

    -- Properties / modules
    ["@property"] = var,
    ["@module"] = var,
    ["@module.builtin"] = { fg = t.fg, italic = true },
    ["@namespace"] = var,

    -- Attributes / decorators
    ["@attribute"] = { fg = t.blue, italic = true },
    ["@attribute.builtin"] = { fg = t.blue, italic = true },

    -- Tags (HTML / JSX)
    ["@tag"] = { fg = t.green },
    ["@tag.attribute"] = { fg = t.violet },
    ["@tag.delimiter"] = { fg = t.fg_dim },
    ["@tag.builtin"] = { fg = t.green },

    -- Comments
    ["@comment"] = cmt,
    ["@comment.documentation"] = cmt,
    ["@comment.error"] = { fg = t.red },
    ["@comment.warning"] = { fg = t.warn },
    ["@comment.todo"] = { fg = t.green, bold = true },
    ["@comment.note"] = { fg = t.info },

    -- Markup (Markdown etc.)
    ["@markup.heading"] = { fg = t.green, bold = true },
    ["@markup.heading.1"] = { fg = t.green, bold = true },
    ["@markup.heading.2"] = { fg = t.green, bold = true },
    ["@markup.heading.3"] = { fg = t.green },
    ["@markup.heading.4"] = { fg = t.green },
    ["@markup.heading.5"] = { fg = t.green },
    ["@markup.heading.6"] = { fg = t.green },
    ["@markup.strong"] = { fg = t.fg, bold = true },
    ["@markup.italic"] = { fg = t.fg, italic = true },
    ["@markup.strikethrough"] = { fg = t.fg_dim, strikethrough = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.link"] = { fg = t.blue, underline = true },
    ["@markup.link.label"] = { fg = t.blue },
    ["@markup.link.url"] = { fg = t.teal, underline = true },
    ["@markup.raw"] = { fg = t.gold },
    ["@markup.raw.block"] = { fg = t.gold },
    ["@markup.list"] = { fg = t.green },
    ["@markup.list.checked"] = { fg = t.green },
    ["@markup.list.unchecked"] = { fg = t.fg_gutter },
    ["@markup.quote"] = { fg = t.comment, italic = true },
    ["@markup.math"] = { fg = t.teal },
    ["@markup.environment"] = { fg = t.violet },
    ["@markup.environment.name"] = { fg = t.violet },

    -- Diff
    ["@diff.plus"] = { fg = t.git_add },
    ["@diff.minus"] = { fg = t.git_delete },
    ["@diff.delta"] = { fg = t.git_change },

    -- LSP semantic tokens
    ["@lsp.type.class"] = { link = "@type" },
    ["@lsp.type.struct"] = { link = "@type" },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.interface"] = { link = "@type" },
    ["@lsp.type.type"] = { link = "@type" },
    ["@lsp.type.typeParameter"] = { link = "@type.definition" },
    ["@lsp.type.method"] = { link = "@function.method" },
    ["@lsp.type.function"] = { link = "@function" },
    ["@lsp.type.parameter"] = { link = "@variable.parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.variable"] = { link = "@variable" },
    ["@lsp.type.keyword"] = { link = "@keyword" },
    ["@lsp.type.number"] = { link = "@number" },
    ["@lsp.type.enumMember"] = { link = "@constant" },
    ["@lsp.type.string"] = { link = "@string" },
    ["@lsp.type.operator"] = { link = "@operator" },
    ["@lsp.type.comment"] = { link = "@comment" },
    ["@lsp.type.decorator"] = { link = "@attribute" },
    ["@lsp.type.namespace"] = { link = "@module" },
    ["@lsp.type.macro"] = { link = "@function.macro" },
    ["@lsp.type.selfParameter"] = { link = "@variable.builtin" },
    ["@lsp.type.builtinType"] = { link = "@type.builtin" },
    ["@lsp.mod.readonly"] = { link = "@constant" },
    ["@lsp.mod.deprecated"] = { strikethrough = true },
    ["@lsp.mod.defaultLibrary"] = { link = "@function.builtin" },
  }
end

return M
