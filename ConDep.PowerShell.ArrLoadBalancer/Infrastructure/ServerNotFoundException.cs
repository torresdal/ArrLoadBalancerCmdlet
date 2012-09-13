using System;

namespace ConDep.PowerShell.ApplicationRequestRouting.Infrastructure
{
    public class ServerNotFoundException : Exception
    {
        public ServerNotFoundException(string message) : base(message) {}
    }
}