namespace ConDep.PowerShell.ArrLoadBalancer.Infrastructure
{
    public class FarmServerStats
    {
        public string Name { get; set; }

        public bool Online { get; set; }

        public FarmServerState State { get; set; }

        public bool Healthy { get; set; }
    }
}