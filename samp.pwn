#include <a_samp>

// Array of server names
new ServerNames[][] = {
    "Server Name 1",
    "Server Name 2",
    "Server Name 3"
};
new CurrentNameIndex = 0;
new TimerHandle;

public OnGameModeInit()
{
    // Start the timer to change the server name every 10 minutes (600000 milliseconds)
    TimerHandle = SetTimer("ChangeServerName", 600000, true);
    return 1;
}

forward ChangeServerName();
public ChangeServerName()
{
    // Update the server name to the next one in the array
    new cmd[128];
    format(cmd, sizeof(cmd), "hostname %s", ServerNames[CurrentNameIndex]);
    SendRconCommand(cmd);

    // Move to the next server name, wrap around if necessary
    CurrentNameIndex++;
    if (CurrentNameIndex >= sizeof(ServerNames))
    {
        CurrentNameIndex = 0;
    }
}

public OnGameModeExit()
{
    // Kill the timer when the game mode exits
    KillTimer(TimerHandle);
    return 1;
}
