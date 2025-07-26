local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local sn = ls.snippet_node

-- Function to get the current filename without extension
local function filename()
  return vim.fn.expand '%:t:r'
end

-- Function to convert snake_case filename to PascalCase
local function to_pascal_case(str)
  -- Handle already PascalCase or camelCase
  if str:match '^[A-Z]' or not str:match '_' then
    return str:sub(1, 1):upper() .. str:sub(2)
  end

  -- Convert snake_case to PascalCase
  local result = str:gsub('_(.)', function(match)
    return match:upper()
  end)
  return result:sub(1, 1):upper() .. result:sub(2)
end

return {
  -- Freezed import snippet
  s('fpart', {
    t "import 'package:freezed_annotation/freezed_annotation.dart';",
    t { '', '', '' },
    t "part '",
    f(function()
      return filename()
    end),
    t ".freezed.dart';",
    t { '', "part '" },
    f(function()
      return filename()
    end),
    t ".g.dart';",
    t { '', '' },
    i(0), -- Cursor ends up here
  }),

  -- Freezed class snippet
  s('fdc', {
    t '@freezed',
    t { '', 'abstract class ' },
    d(1, function()
      return sn(nil, {
        i(1, to_pascal_case(filename())),
      })
    end),
    t ' with _$',
    f(function(args)
      return args[1][1]
    end, { 1 }),
    t ' {',
    t { '', '  const factory ' },
    f(function(args)
      return args[1][1]
    end, { 1 }),
    t '(',
    i(0),
    t ') = _',
    f(function(args)
      return args[1][1]
    end, { 1 }),
    t ';',
    t { '', '', '  factory ' },
    f(function(args)
      return args[1][1]
    end, { 1 }),
    t '.fromJson(Map<String, dynamic> json) =>',
    t { '', '      _$' },
    f(function(args)
      return args[1][1]
    end, { 1 }),
    t 'FromJson(json);',
    t { '', '}' },
  }),
}
