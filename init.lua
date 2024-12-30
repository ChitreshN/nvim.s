require("chit")
-- Function to toggle conceal for Haskell files
function Toggle_haskell_conceal()
    if vim.bo.filetype == "haskell" then
        if vim.wo.conceallevel == 0 then
            vim.wo.conceallevel = 2
            vim.cmd [[
        syntax match HaskellArrow "->" conceal cchar=→
        syntax match HaskellArrow "=>" conceal cchar=⇒
        syntax match HaskellArrow "<-" conceal cchar=←
        syntax match HaskellArrow "\\" conceal cchar=λ
        highlight Conceal guifg=#FFD700 ctermfg=220 gui=bold cterm=bold
      ]]
            print("Haskell conceal enabled")
        else
            vim.wo.conceallevel = 0
            vim.cmd [[syntax clear HaskellArrow]]
            print("Haskell conceal disabled")
        end
    else
        print("Not a Haskell file")
    end
end

-- Keymap to toggle conceal (replace <leader>c with your desired keybinding)
vim.api.nvim_set_keymap("n", "<leader>hc", ":lua Toggle_haskell_conceal()<CR>", { noremap = true, silent = true })
