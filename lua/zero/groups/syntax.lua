local M = {}

function M.get(t, opts)
  local s = opts.styles or {}
  local comments = vim.tbl_extend("force", { fg = t.comment }, s.comments or {})
  local keywords = vim.tbl_extend("force", { fg = t.green }, s.keywords or {})
  local functions = vim.tbl_extend("force", { fg = t.blue }, s.functions or {})
  local variables = vim.tbl_extend("force", { fg = t.fg }, s.variables or {})
  local booleans = vim.tbl_extend("force", { fg = t.orange }, s.booleans or {})

  return {
    Comment = comments,
    SpecialComment = { fg = t.comment, italic = true },

    Constant = { fg = t.orange },
    String = { fg = t.gold },
    Character = { fg = t.gold },
    Number = { fg = t.orange },
    Float = { fg = t.orange },
    Boolean = booleans,

    Identifier = variables,
    Function = functions,

    Statement = keywords,
    Conditional = { link = "Statement" },
    Repeat = { link = "Statement" },
    Label = { link = "Statement" },
    Operator = { fg = t.teal },
    Keyword = { link = "Statement" },
    Exception = { link = "Statement" },

    PreProc = { fg = t.violet },
    Include = { fg = t.green },
    Define = { fg = t.violet },
    Macro = { fg = t.violet },
    PreCondit = { link = "PreProc" },

    Type = { fg = t.violet },
    StorageClass = { link = "Type" },
    Structure = { link = "Type" },
    Typedef = { link = "Type" },

    Special = { fg = t.teal },
    SpecialChar = { fg = t.orange },
    Tag = { fg = t.green },
    Delimiter = { fg = t.fg_dim },

    Error = { fg = t.red },
    Todo = { fg = t.green, bold = true },
    Underlined = { underline = true },
    Ignore = { fg = t.fg_gutter },

    -- HTML / XML
    htmlTag = { fg = t.fg_dim },
    htmlEndTag = { fg = t.fg_dim },
    htmlTagName = { fg = t.green },
    htmlArg = { fg = t.blue },
    htmlTitle = { fg = t.fg, bold = true },
    htmlH1 = { fg = t.green, bold = true },
    htmlH2 = { fg = t.green, bold = true },
    htmlH3 = { fg = t.green },
    htmlLink = { fg = t.blue, underline = true },
    htmlSpecialChar = { fg = t.orange },
    xmlTag = { link = "htmlTag" },
    xmlEndTag = { link = "htmlEndTag" },
    xmlTagName = { link = "htmlTagName" },
    xmlAttrib = { link = "htmlArg" },

    -- Markdown (legacy)
    markdownH1 = { fg = t.green, bold = true },
    markdownH2 = { fg = t.green, bold = true },
    markdownH3 = { fg = t.green },
    markdownH4 = { fg = t.green },
    markdownH5 = { fg = t.green },
    markdownH6 = { fg = t.green },
    markdownCode = { fg = t.gold },
    markdownCodeBlock = { fg = t.gold },
    markdownBold = { fg = t.fg, bold = true },
    markdownItalic = { fg = t.fg, italic = true },
    markdownLinkText = { fg = t.blue, underline = true },
    markdownUrl = { fg = t.teal, underline = true },
    markdownListMarker = { fg = t.green },
    markdownOrderedListMarker = { fg = t.green },
    markdownRule = { fg = t.comment },
    markdownHeadingDelimiter = { fg = t.green, bold = true },

    -- YAML
    yamlKey = { fg = t.blue },
    yamlAnchor = { fg = t.teal },
    yamlAlias = { fg = t.teal },
    yamlDocumentStart = { fg = t.comment },
    yamlDocumentEnd = { fg = t.comment },

    -- JSON
    jsonKeyword = { fg = t.blue },
    jsonBoolean = booleans,
    jsonNumber = { fg = t.orange },
    jsonString = { fg = t.gold },
    jsonNull = { fg = t.violet },

    -- CSS
    cssClassName = { fg = t.blue },
    cssIdentifier = { fg = t.blue },
    cssProp = { fg = t.teal },
    cssTagName = { fg = t.green },
    cssAttr = { fg = t.orange },
    cssColor = { fg = t.gold },

    -- Python
    pythonBuiltin = { fg = t.violet },
    pythonDecorator = { fg = t.blue, italic = true },
    pythonDecoratorName = { fg = t.blue, italic = true },

    -- Rust
    rustKeyword = { link = "Keyword" },
    rustLifetime = { fg = t.orange, italic = true },
    rustDerive = { fg = t.blue, italic = true },
    rustMacro = { fg = t.blue },

    -- TypeScript / JavaScript
    typescriptImport = { link = "Include" },
    typescriptExport = { link = "Include" },
    typescriptArrow = { fg = t.teal },
    typescriptTypeAnnotation = { fg = t.fg_dim },
    typescriptInterfaceName = { fg = t.violet },
    typescriptClassName = { fg = t.violet },
    javascriptArrowFunc = { fg = t.teal },
  }
end

return M
