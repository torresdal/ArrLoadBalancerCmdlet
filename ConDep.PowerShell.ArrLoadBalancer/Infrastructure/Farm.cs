using System.Collections.Generic;

namespace ConDep.PowerShell.ArrLoadBalancer.Infrastructure
{
    public class Farm
    {
        private readonly List<FarmServer> _servers = new List<FarmServer>();

        public string Name { get; set; }
        public List<FarmServer> Servers { get { return _servers; } }  
    }
}