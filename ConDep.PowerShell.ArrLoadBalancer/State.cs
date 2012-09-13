namespace ConDep.PowerShell.ArrLoadBalancer
{
    public enum State
    {
        Offline,
        Online,
        Unavailable,
        Available,
        DisallowNewConnections,
        Healthy,
        Unhealthy
    }
}