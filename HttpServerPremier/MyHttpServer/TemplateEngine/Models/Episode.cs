using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TemplateEngine.Models
{
    public class Episode
    {
        public int episode_id { get; set; }
        public int series_id { get; set; }
        public int episode_number { get; set; }
        public string logo_url { get; set; }
    }
}
