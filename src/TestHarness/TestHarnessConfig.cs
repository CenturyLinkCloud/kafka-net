using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestHarness
{
    public static class TestHardnessConfig
    {
        public static List<Uri> KafkaBrokerList
        {
            get
            {
                var list = ConfigurationManager.AppSettings["TestHarnessKafkaBrokerList"];
                if (String.IsNullOrEmpty(list)) 
                    throw new ConfigurationErrorsException("TestHarnessKafkaBrokerList must be specified in the app.config file.");
                return list.Split(',').Select(u => new Uri(u)).ToList();
            }
        }
    }
}
