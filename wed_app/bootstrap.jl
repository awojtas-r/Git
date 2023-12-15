(pwd() != @__DIR__) && cd(@__DIR__) # allow starting app from bin/ dir

using WedApp
const UserApp = WedApp
WedApp.main()
