using HttpServerLibrary.Attributes;
using HttpServerLibrary.Core;
using HttpServerLibrary.HttpResponse;
using MyHttpServer.Models;
using MyHttpServer.Session;
using MyORMLibrary;
using System.Data.SqlClient;

namespace MyHttpServer.Endponts
{
    public class AdminEndpoint : BaseEndpoint
    {
        [Get("admin")]
        public IHttpResponseResult GetAdminPanel()
        {
            var file = File.ReadAllText(@"Templates/Pages/AdminPage/AdminPage.html");
            var token = Context.Request.Cookies["session-token"].ToString().Split('=').GetValue(1);
            string connectionString =
                @"Server=localhost; Database=PremierDataBase; User Id=sa; Password=P@ssw0rd;TrustServerCertificate=true;"; ;
            var connection = new SqlConnection(connectionString);
            var dBcontext = new ORMContext<User>(connection);

            if (!IsAuthorized(Context))
            {
                return Redirect("login");
            }
            else
            {
                var userID = SessionStorage.GetUserId(token.ToString());
                var is_admin = dBcontext.CheckUserByValideAdmin(userID);
                if (is_admin == 0)
                {
                    return Html(file);
                }
                else
                {
                    return Redirect("mainpage");
                }
            }
        }

        public bool IsAuthorized(HttpRequestContext context)
        {
            // Проверка наличия Cookie с session-token
            if (context.Request.Cookies.Any(c => c.Name == "session-token"))
            {
                var cookie = context.Request.Cookies["session-token"];
                return SessionStorage.ValidateToken(cookie.Value);
            }

            return false;
        }
    }
}
