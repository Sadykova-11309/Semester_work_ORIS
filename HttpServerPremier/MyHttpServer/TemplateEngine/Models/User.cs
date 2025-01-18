namespace MyHttpServer.Models
{
    public class User
    {
        public int user_id { get; set; }
        public string email { get; set; }

        public string password { get; set; }

        public int is_admin { get; set; }
    }
}
