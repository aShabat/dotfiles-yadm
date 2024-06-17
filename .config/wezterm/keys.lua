local wezterm = require("wezterm")
local act = wezterm.action

local module = {}

module.test = function()
    wezterm.log_error("test")
end

module.apply = function(config)
    wezterm.log_error("test")
    config.disable_default_key_bindings = true

    config.keys = {
        { key = 'Tab',        mods = 'ALT',            action = act.ActivateTabRelative(1) },
        { key = 'Tab',        mods = 'SHIFT|ALT',      action = act.ActivateTabRelative(-1) },
        { key = 'h',          mods = 'ALT',            action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
        { key = 'v',          mods = 'ALT',            action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
        { key = 'c',          mods = 'ALT',            action = act.CloseCurrentPane { confirm = false } },
        { key = '\'',         mods = 'SHIFT|ALT|CTRL', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
        { key = '+',          mods = 'ALT',            action = act.IncreaseFontSize },
        { key = '+',          mods = 'SHIFT|ALT',      action = act.IncreaseFontSize },
        { key = '-',          mods = 'ALT',            action = act.DecreaseFontSize },
        { key = '-',          mods = 'SHIFT|ALT',      action = act.DecreaseFontSize },
        { key = '0',          mods = 'ALT',            action = act.ResetFontSize },
        { key = '1',          mods = 'SHIFT|ALT',      action = act.ActivateTab(0) },
        { key = '2',          mods = 'SHIFT|ALT',      action = act.ActivateTab(1) },
        { key = '3',          mods = 'SHIFT|ALT',      action = act.ActivateTab(2) },
        { key = '4',          mods = 'SHIFT|ALT',      action = act.ActivateTab(3) },
        { key = '5',          mods = 'SHIFT|ALT',      action = act.ActivateTab(4) },
        { key = '6',          mods = 'SHIFT|ALT',      action = act.ActivateTab(5) },
        { key = '7',          mods = 'SHIFT|ALT',      action = act.ActivateTab(6) },
        { key = '8',          mods = 'SHIFT|ALT',      action = act.ActivateTab(7) },
        { key = '9',          mods = 'SHIFT|ALT',      action = act.ActivateTab(-1) },
        { key = 'C',          mods = 'CTRL',           action = act.CopyTo 'Clipboard' },
        { key = 'C',          mods = 'SHIFT|CTRL',     action = act.CopyTo 'Clipboard' },
        { key = 'L',          mods = 'ALT',            action = act.ShowDebugOverlay },
        { key = 'L',          mods = 'SHIFT|ALT',      action = act.ShowDebugOverlay },
        { key = 'P',          mods = 'ALT',            action = act.ActivateCommandPalette },
        { key = 'P',          mods = 'SHIFT|ALT',      action = act.ActivateCommandPalette },
        { key = 'R',          mods = 'SHIFT|ALT',      action = act.ReloadConfiguration },
        { key = 'n',          mods = 'ALT',            action = act.SpawnTab 'CurrentPaneDomain' },
        { key = 'c',          mods = 'ALT|SHIFT',            action = act.CloseCurrentTab { confirm = true } },
        { key = 'V',          mods = 'CTRL',           action = act.PasteFrom 'Clipboard' },
        { key = 'V',          mods = 'SHIFT|CTRL',     action = act.PasteFrom 'Clipboard' },
        { key = 'X',          mods = 'ALT',            action = act.ActivateCopyMode },
        { key = 'X',          mods = 'SHIFT|ALT',      action = act.ActivateCopyMode },
        { key = 'PageUp',     mods = 'SHIFT',          action = act.ScrollByPage(-0.5) },
        { key = 'PageDown',   mods = 'SHIFT',          action = act.ScrollByPage(0.5) },
        { key = 'LeftArrow',  mods = 'ALT',            action = act.ActivatePaneDirection 'Left' },
        { key = 'LeftArrow',  mods = 'SHIFT|ALT',      action = act.AdjustPaneSize { 'Left', 1 } },
        { key = 'RightArrow', mods = 'SHIFT',          action = act.ActivatePaneDirection 'Right' },
        { key = 'RightArrow', mods = 'SHIFT|ALT',      action = act.AdjustPaneSize { 'Right', 1 } },
        { key = 'UpArrow',    mods = 'SHIFT',          action = act.ActivatePaneDirection 'Up' },
        { key = 'UpArrow',    mods = 'SHIFT|ALT',      action = act.AdjustPaneSize { 'Up', 1 } },
        { key = 'DownArrow',  mods = 'SHIFT',          action = act.ActivatePaneDirection 'Down' },
        { key = 'DownArrow',  mods = 'SHIFT|ALT',      action = act.AdjustPaneSize { 'Down', 1 } },
    }

    config.key_tables = {
        copy_mode = {
            { key = 'Tab',        mods = 'NONE',  action = act.CopyMode 'MoveForwardWord' },
            { key = 'Tab',        mods = 'SHIFT', action = act.CopyMode 'MoveBackwardWord' },
            { key = 'Enter',      mods = 'NONE',  action = act.CopyMode 'MoveToStartOfNextLine' },
            { key = 'Escape',     mods = 'NONE',  action = act.CopyMode 'Close' },
            { key = 'Space',      mods = 'NONE',  action = act.CopyMode { SetSelectionMode = 'Cell' } },
            { key = '$',          mods = 'NONE',  action = act.CopyMode 'MoveToEndOfLineContent' },
            { key = '$',          mods = 'SHIFT', action = act.CopyMode 'MoveToEndOfLineContent' },
            { key = ',',          mods = 'NONE',  action = act.CopyMode 'JumpReverse' },
            { key = '0',          mods = 'NONE',  action = act.CopyMode 'MoveToStartOfLine' },
            { key = ';',          mods = 'NONE',  action = act.CopyMode 'JumpAgain' },
            { key = 'F',          mods = 'NONE',  action = act.CopyMode { JumpBackward = { prev_char = false } } },
            { key = 'F',          mods = 'SHIFT', action = act.CopyMode { JumpBackward = { prev_char = false } } },
            { key = 'G',          mods = 'NONE',  action = act.CopyMode 'MoveToScrollbackBottom' },
            { key = 'G',          mods = 'SHIFT', action = act.CopyMode 'MoveToScrollbackBottom' },
            { key = 'H',          mods = 'NONE',  action = act.CopyMode 'MoveToViewportTop' },
            { key = 'H',          mods = 'SHIFT', action = act.CopyMode 'MoveToViewportTop' },
            { key = 'L',          mods = 'NONE',  action = act.CopyMode 'MoveToViewportBottom' },
            { key = 'L',          mods = 'SHIFT', action = act.CopyMode 'MoveToViewportBottom' },
            { key = 'M',          mods = 'NONE',  action = act.CopyMode 'MoveToViewportMiddle' },
            { key = 'M',          mods = 'SHIFT', action = act.CopyMode 'MoveToViewportMiddle' },
            { key = 'O',          mods = 'NONE',  action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
            { key = 'O',          mods = 'SHIFT', action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
            { key = 'T',          mods = 'NONE',  action = act.CopyMode { JumpBackward = { prev_char = true } } },
            { key = 'T',          mods = 'SHIFT', action = act.CopyMode { JumpBackward = { prev_char = true } } },
            { key = 'V',          mods = 'NONE',  action = act.CopyMode { SetSelectionMode = 'Line' } },
            { key = 'V',          mods = 'SHIFT', action = act.CopyMode { SetSelectionMode = 'Line' } },
            { key = '^',          mods = 'NONE',  action = act.CopyMode 'MoveToStartOfLineContent' },
            { key = '^',          mods = 'SHIFT', action = act.CopyMode 'MoveToStartOfLineContent' },
            { key = 'b',          mods = 'NONE',  action = act.CopyMode 'MoveBackwardWord' },
            { key = 'b',          mods = 'ALT',   action = act.CopyMode 'MoveBackwardWord' },
            { key = 'b',          mods = 'CTRL',  action = act.CopyMode 'PageUp' },
            { key = 'c',          mods = 'CTRL',  action = act.CopyMode 'Close' },
            { key = 'd',          mods = 'CTRL',  action = act.CopyMode { MoveByPage = (0.5) } },
            { key = 'e',          mods = 'NONE',  action = act.CopyMode 'MoveForwardWordEnd' },
            { key = 'f',          mods = 'NONE',  action = act.CopyMode { JumpForward = { prev_char = false } } },
            { key = 'f',          mods = 'ALT',   action = act.CopyMode 'MoveForwardWord' },
            { key = 'f',          mods = 'CTRL',  action = act.CopyMode 'PageDown' },
            { key = 'g',          mods = 'NONE',  action = act.CopyMode 'MoveToScrollbackTop' },
            { key = 'g',          mods = 'CTRL',  action = act.CopyMode 'Close' },
            { key = 'h',          mods = 'NONE',  action = act.CopyMode 'MoveLeft' },
            { key = 'j',          mods = 'NONE',  action = act.CopyMode 'MoveDown' },
            { key = 'k',          mods = 'NONE',  action = act.CopyMode 'MoveUp' },
            { key = 'l',          mods = 'NONE',  action = act.CopyMode 'MoveRight' },
            { key = 'm',          mods = 'ALT',   action = act.CopyMode 'MoveToStartOfLineContent' },
            { key = 'o',          mods = 'NONE',  action = act.CopyMode 'MoveToSelectionOtherEnd' },
            { key = 'q',          mods = 'NONE',  action = act.CopyMode 'Close' },
            { key = 't',          mods = 'NONE',  action = act.CopyMode { JumpForward = { prev_char = true } } },
            { key = 'u',          mods = 'CTRL',  action = act.CopyMode { MoveByPage = (-0.5) } },
            { key = 'v',          mods = 'NONE',  action = act.CopyMode { SetSelectionMode = 'Cell' } },
            { key = 'v',          mods = 'CTRL',  action = act.CopyMode { SetSelectionMode = 'Block' } },
            { key = 'w',          mods = 'NONE',  action = act.CopyMode 'MoveForwardWord' },
            { key = 'y',          mods = 'NONE',  action = act.Multiple { { CopyTo = 'ClipboardAndPrimarySelection' }, { CopyMode = 'Close' } } },
            { key = 'PageUp',     mods = 'NONE',  action = act.CopyMode 'PageUp' },
            { key = 'PageDown',   mods = 'NONE',  action = act.CopyMode 'PageDown' },
            { key = 'End',        mods = 'NONE',  action = act.CopyMode 'MoveToEndOfLineContent' },
            { key = 'Home',       mods = 'NONE',  action = act.CopyMode 'MoveToStartOfLine' },
            { key = 'LeftArrow',  mods = 'NONE',  action = act.CopyMode 'MoveLeft' },
            { key = 'LeftArrow',  mods = 'ALT',   action = act.CopyMode 'MoveBackwardWord' },
            { key = 'RightArrow', mods = 'NONE',  action = act.CopyMode 'MoveRight' },
            { key = 'RightArrow', mods = 'ALT',   action = act.CopyMode 'MoveForwardWord' },
            { key = 'UpArrow',    mods = 'NONE',  action = act.CopyMode 'MoveUp' },
            { key = 'DownArrow',  mods = 'NONE',  action = act.CopyMode 'MoveDown' },
        },

        search_mode = {
            { key = 'Enter',     mods = 'NONE', action = act.CopyMode 'PriorMatch' },
            { key = 'Escape',    mods = 'NONE', action = act.CopyMode 'Close' },
            { key = 'n',         mods = 'CTRL', action = act.CopyMode 'NextMatch' },
            { key = 'p',         mods = 'CTRL', action = act.CopyMode 'PriorMatch' },
            { key = 'r',         mods = 'CTRL', action = act.CopyMode 'CycleMatchType' },
            { key = 'u',         mods = 'CTRL', action = act.CopyMode 'ClearPattern' },
            { key = 'PageUp',    mods = 'NONE', action = act.CopyMode 'PriorMatchPage' },
            { key = 'PageDown',  mods = 'NONE', action = act.CopyMode 'NextMatchPage' },
            { key = 'UpArrow',   mods = 'NONE', action = act.CopyMode 'PriorMatch' },
            { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'NextMatch' },
        },

    }
end

return module