using System;

namespace ConDep.PowerShell.ApplicationRequestRouting.Infrastructure
{
    public class ServerFarmNotFoundException : Exception
    {
        public ServerFarmNotFoundException(string message) : base(message) {}
    }
}