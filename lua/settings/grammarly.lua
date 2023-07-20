local credentials = require("settings.credentials")

return {
  filetypes = { 'markdown', 'tex' },
  init_options = {
    clientId = credentials["grammarly"],
  },
}

