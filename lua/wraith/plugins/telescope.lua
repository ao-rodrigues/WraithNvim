local setup_telescope, telescope = pcall(require, "telescope")
if not setup_telescope then
  return
end

local setup_actions, actions = pcall(require, "telescope.actions")
if not setup_actions then
  return
end

telescope.setup()
telescope.load_extension("fzf")
