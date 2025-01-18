using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyHttpServer.Models
{
    public class Series
    {
        public int series_id {  get; set; }
        public string title {  get; set; }
        public string logo_url {  get; set; }
        public string poster_url { get; set; }
        public int year { get; set; }
        public string description { get; set; }
        public int rating { get; set; }
        public string genre { get; set; }
        public string country { get; set; }
        public string plot { get; set; }

    }
}
