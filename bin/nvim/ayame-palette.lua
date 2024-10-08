local M = {}

function M.get()
    return {
        background      = "#130f1e", -- Background
        bg              = "#130f1e", -- Background
        bg900           = "#130f1e", -- Background
        foreground      = "#cbbade", -- Foreground, Variables, Identifiers
        fg              = "#cbbade", -- Foreground, Variables, Identifiers
        fg200           = "#cbbade", -- Foreground, Variables, Identifiers
        variable        = "#cbbade", -- Foreground, Variables, Identifiers
        identifier      = "#cbbade", -- Foreground, Variables, Identifiers
        red             = "#ff577e", -- Terminal Bright Red, Git deleted, Breakpoints, Stop, Language variables, Markdown bold
        deleted         = "#ff577e", -- Terminal Bright Red, Git deleted, Breakpoints, Stop, Language variables, Markdown bold
        breakpoint      = "#ff577e", -- Terminal Bright Red, Git deleted, Breakpoints, Stop, Language variables, Markdown bold
        stop            = "#ff577e", -- Terminal Bright Red, Git deleted, Breakpoints, Stop, Language variables, Markdown bold
        this            = "#ff577e", -- Terminal Bright Red, Git deleted, Breakpoints, Stop, Language variables, Markdown bold
        bold            = "#ff577e", -- Terminal Bright Red, Git deleted, Breakpoints, Stop, Language variables, Markdown bold
        red500          = "#ff577e", -- Terminal Bright Red, Git deleted, Breakpoints, Stop, Language variables, Markdown bold
        orange          = "#ff965c", -- Terminal Yellow, Warnings, Constants
        warning         = "#ff965c", -- Terminal Yellow, Warnings, Constants
        constant        = "#ff965c", -- Terminal Yellow, Warnings, Constants
        orange500       = "#ff965c", -- Terminal Yellow, Warnings, Constants
        yellow          = "#f5cb40", -- Terminal Bright Yellow, Characters, HTML attributes, CSS classes, Markdown alt text, Markdown link anchors
        character       = "#f5cb40", -- Terminal Bright Yellow, Characters, HTML attributes, CSS classes, Markdown alt text, Markdown link anchors
        yellow500       = "#f5cb40", -- Terminal Bright Yellow, Characters, HTML attributes, CSS classes, Markdown alt text, Markdown link anchors
        green           = "#96e474", -- Terminal Bright Green, Git added, Debug, Strings
        added           = "#96e474", -- Terminal Bright Green, Git added, Debug, Strings
        debug           = "#96e474", -- Terminal Bright Green, Git added, Debug, Strings
        string          = "#96e474", -- Terminal Bright Green, Git added, Debug, Strings
        green500        = "#96e474", -- Terminal Bright Green, Git added, Debug, Strings
        teal            = "#5df8a6", -- TODO comments
        todo            = "#5df8a6", -- TODO comments
        teal500         = "#5df8a6", -- TODO comments
        cyan            = "#54e7f8", -- Terminal Bright Cyan, Find matches, Hyperlink hover, Control keywords, RegEx literals, Escape characters, Markdown italics
        match           = "#54e7f8", -- Terminal Bright Cyan, Find matches, Hyperlink hover, Control keywords, RegEx literals, Escape characters, Markdown italics
        control         = "#54e7f8", -- Terminal Bright Cyan, Find matches, Hyperlink hover, Control keywords, RegEx literals, Escape characters, Markdown italics
        regex           = "#54e7f8", -- Terminal Bright Cyan, Find matches, Hyperlink hover, Control keywords, RegEx literals, Escape characters, Markdown italics
        escape          = "#54e7f8", -- Terminal Bright Cyan, Find matches, Hyperlink hover, Control keywords, RegEx literals, Escape characters, Markdown italics
        italics         = "#54e7f8", -- Terminal Bright Cyan, Find matches, Hyperlink hover, Control keywords, RegEx literals, Escape characters, Markdown italics
        cyan500         = "#54e7f8", -- Terminal Bright Cyan, Find matches, Hyperlink hover, Control keywords, RegEx literals, Escape characters, Markdown italics
        linkhover       = "#54e7f8", -- Terminal Bright Cyan, Find matches, Hyperlink hover, Control keywords, RegEx literals, Escape characters, Markdown italics
        blue            = "#44a3f5", -- Terminal Bright Blue, Progress bars, Git modified, Hyperlinks, Keywords, Type
        primary         = "#44a3f5", -- Terminal Bright Blue, Progress bars, Git modified, Hyperlinks, Keywords, Type
        progress        = "#44a3f5", -- Terminal Bright Blue, Progress bars, Git modified, Hyperlinks, Keywords, Type
        modified        = "#44a3f5", -- Terminal Bright Blue, Progress bars, Git modified, Hyperlinks, Keywords, Type
        hyperlink       = "#44a3f5", -- Terminal Bright Blue, Progress bars, Git modified, Hyperlinks, Keywords, Type
        keyword         = "#44a3f5", -- Terminal Bright Blue, Progress bars, Git modified, Hyperlinks, Keywords, Type
        type            = "#44a3f5", -- Terminal Bright Blue, Progress bars, Git modified, Hyperlinks, Keywords, Type
        blue500         = "#44a3f5", -- Terminal Bright Blue, Progress bars, Git modified, Hyperlinks, Keywords, Type
        purple          = "#9768f8", -- Terminal Magenta, Debug token keys, Functions, Attributes, Markdown plain code blocks
        darkmagenta     = "#9768f8", -- Terminal Magenta, Debug token keys, Functions, Attributes, Markdown plain code blocks
        secondary       = "#9768f8", -- Terminal Magenta, Debug token keys, Functions, Attributes, Markdown plain code blocks
        fun             = "#9768f8", -- Terminal Magenta, Debug token keys, Functions, Attributes, Markdown plain code blocks
        attribute       = "#9768f8", -- Terminal Magenta, Debug token keys, Functions, Attributes, Markdown plain code blocks
        code            = "#9768f8", -- Terminal Magenta, Debug token keys, Functions, Attributes, Markdown plain code blocks
        purple500       = "#9768f8", -- Terminal Magenta, Debug token keys, Functions, Attributes, Markdown plain code blocks
        magenta         = "#f76ef1", -- Terminal Bright Magenta, Debug token values, Focus accents, Operator keywords
        pink            = "#f76ef1", -- Terminal Bright Magenta, Debug token values, Focus accents, Operator keywords
        tertiary        = "#f76ef1", -- Terminal Bright Magenta, Debug token values, Focus accents, Operator keywords
        focus           = "#f76ef1", -- Terminal Bright Magenta, Debug token values, Focus accents, Operator keywords
        operator        = "#f76ef1", -- Terminal Bright Magenta, Debug token values, Focus accents, Operator keywords
        magenta500      = "#f76ef1", -- Terminal Bright Magenta, Debug token values, Focus accents, Operator keywords
        value           = "#f76ef1", -- Terminal Bright Magenta, Debug token values, Focus accents, Operator keywords
        red900          = "#662332", -- Error background
        error2          = "#662332", -- Error background
        red700          = "#cc4665", -- Terminal Red, Error, Invalid, Tags
        darkred         = "#cc4665", -- Terminal Red, Error, Invalid, Tags
        error           = "#cc4665", -- Terminal Red, Error, Invalid, Tags
        invalid         = "#cc4665", -- Terminal Red, Error, Invalid, Tags
        tag             = "#cc4665", -- Terminal Red, Error, Invalid, Tags
        red300          = "#ff7998",
        red100          = "#ffbccb",
        orange900       = "#663c25",
        orange700       = "#cc784a",
        orange300       = "#ffab7d",
        orange100       = "#ffd5be",
        yellow900       = "#62511a",
        yellow700       = "#c4a233",
        yellow300       = "#f7d566",
        yellow100       = "#fbeab3",
        green900        = "#3c5b2e",
        green700        = "#78b65d", -- Terminal Green, Info, String quotation marks
        darkgreen       = "#78b65d", -- Terminal Green, Info, String quotation marks
        info            = "#78b65d", -- Terminal Green, Info, String quotation marks
        green300        = "#abe990",
        green100        = "#d5f4c7",
        teal900         = "#256342",
        teal700         = "#4ac685",
        teal300         = "#7df9b8",
        teal100         = "#befcdb",
        cyan900         = "#225c63",
        cyan700         = "#43b9c6", -- Terminal Cyan, Classes
        darkcyan        = "#43b9c6", -- Terminal Cyan, Classes
        class           = "#43b9c6", -- Terminal Cyan, Classes
        cyan300         = "#76ecf9",
        cyan100         = "#bbf5fc",
        blue900         = "#1b4162",
        blue700         = "#3682c4", -- Terminal Blue, Bookmarks, VS Code activity badge
        darkblue        = "#3682c4", -- Terminal Blue, Bookmarks, VS Code activity badge
        activitybadge   = "#3682c4", -- Terminal Blue, Bookmarks, VS Code activity badge
        bookmark        = "#3682c4", -- Terminal Blue, Bookmarks, VS Code activity badge
        blue2           = "#3682c4", -- Terminal Blue, Bookmarks, VS Code activity badge
        blue300         = "#69b5f7",
        blue100         = "#b4dafb",
        purple900       = "#3c2a63",
        purple700       = "#7953c6",
        purple300       = "#ac86f9",
        purple100       = "#d5c3fc",
        magenta900      = "#632c60",
        magenta700      = "#c658c1",
        magenta300      = "#f98bf4",
        magenta100      = "#fcc5f9",
        bg800           = "#1a1528", -- Secondary borders
        border2         = "#1a1528", -- Secondary borders
        bg700           = "#221c35", -- Modal background, Checkbox background, Input background
        modal           = "#221c35", -- Modal background, Checkbox background, Input background
        menu            = "#221c35", -- Modal background, Checkbox background, Input background
        toolbar         = "#221c35", -- Modal background, Checkbox background, Input background
        checkbox        = "#221c35", -- Modal background, Checkbox background, Input background
        input           = "#221c35", -- Modal background, Checkbox background, Input background
        bg600           = "#2b2343", -- Subheader background, Line highlight, UI hover highlight
        subheader       = "#2b2343", -- Subheader background, Line highlight, UI hover highlight
        tabline         = "#2b2343", -- Subheader background, Line highlight, UI hover highlight
        hover           = "#2b2343", -- Subheader background, Line highlight, UI hover highlight
        highlight       = "#2b2343", -- Subheader background, Line highlight, UI hover highlight
        bg500           = "#342950", -- Terminal Black, Buttons, Borders, Rules and guides, Line numbers, Alternate row background, Alternate modal background
        black           = "#342950", -- Terminal Black, Buttons, Borders, Rules and guides, Line numbers, Alternate row background, Alternate modal background
        gutter          = "#342950", -- Terminal Black, Buttons, Borders, Rules and guides, Line numbers, Alternate row background, Alternate modal background
        border          = "#342950", -- Terminal Black, Buttons, Borders, Rules and guides, Line numbers, Alternate row background, Alternate modal background
        rule            = "#342950", -- Terminal Black, Buttons, Borders, Rules and guides, Line numbers, Alternate row background, Alternate modal background
        button          = "#342950", -- Terminal Black, Buttons, Borders, Rules and guides, Line numbers, Alternate row background, Alternate modal background
        altrow          = "#342950", -- Terminal Black, Buttons, Borders, Rules and guides, Line numbers, Alternate row background, Alternate modal background
        bg400           = "#3c305d",
        bg300           = "#45376a",
        bg200           = "#4d3e78",
        bg100           = "#564585", -- Terminal Bright Black, Comments, Markdown block quotes, Folded code blocks
        gray            = "#564585", -- Terminal Bright Black, Comments, Markdown block quotes, Folded code blocks
        comment         = "#564585", -- Terminal Bright Black, Comments, Markdown block quotes, Folded code blocks
        blockquote      = "#564585", -- Terminal Bright Black, Comments, Markdown block quotes, Folded code blocks
        folded          = "#564585", -- Terminal Bright Black, Comments, Markdown block quotes, Folded code blocks
        darkgray        = "#564585", -- Terminal Bright Black, Comments, Markdown block quotes, Folded code blocks
        fg900           = "#191023",
        fg800           = "#322145", -- Highlight and focus border, Highlights in UI and modals
        focusborder     = "#322145", -- Highlight and focus border, Highlights in UI and modals
        highlightborder = "#322145", -- Highlight and focus border, Highlights in UI and modals
        modalhighlight  = "#322145", -- Highlight and focus border, Highlights in UI and modals
        highlight2      = "#322145", -- Highlight and focus border, Highlights in UI and modals
        fg700           = "#4a3168", -- Selection background
        selection       = "#4a3168", -- Selection background
        fg600           = "#63428a",
        fg500           = "#7c52ad", -- Markdown underline
        underline       = "#7c52ad", -- Markdown underline
        fg400           = "#9675bd", -- Cursor, Active border, Active line number, Subheader foreground, Badge background, Minimap and scrollbar background, Markdown table text
        cursor          = "#9675bd", -- Cursor, Active border, Active line number, Subheader foreground, Badge background, Minimap and scrollbar background, Markdown table text
        activeborder    = "#9675bd", -- Cursor, Active border, Active line number, Subheader foreground, Badge background, Minimap and scrollbar background, Markdown table text
        active          = "#9675bd", -- Cursor, Active border, Active line number, Subheader foreground, Badge background, Minimap and scrollbar background, Markdown table text
        fg300           = "#b097ce",
        fg100           = "#e5dcef", -- Terminal Bright White, Objects
        white           = "#e5dcef", -- Terminal Bright White, Objects
        object          = "#e5dcef", -- Terminal Bright White, Objects
        bracket         = "#6c8db3", -- Parentheses, Brackets, Braces
        lightgray       = "#8a7d9b", -- Terminal White, Muted text, Punctuation
        darkwhite       = "#8a7d9b", -- Terminal White, Muted text, Punctuation
        muted           = "#8a7d9b", -- Terminal White, Muted text, Punctuation
        punctuation     = "#8a7d9b", -- Terminal White, Muted text, Punctuation
        terminator      = "#8a7d9b", -- Terminal White, Muted text, Punctuation
        foreground2     = "#bbbbbb", -- Alternate foreground
        purewhite       = "#ffffff", -- Extra white for lighter backgrounds, Badge foreground
        header          = "#0b0911", -- Modal header background
    }
end

return M
