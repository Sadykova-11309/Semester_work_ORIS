using System.Data.SqlClient;
using System.Net;
using HttpServerLibrary.Attributes;
using HttpServerLibrary.Core;
using HttpServerLibrary.HttpResponse;
using MyHttpServer.Models;
using MyHttpServer.Session;
using MyORMLibrary;

namespace MyHttpServer.Endponts
{
    public class AuthEndPoint : BaseEndpoint
    {

        [Get("login")]
        public IHttpResponseResult GetLogin()
        {
            var file = File.ReadAllText(@"Templates/Pages/Auth/AuthPage.html");
            if (IsAuthorized(Context)) return Redirect("mainpage");
            return Html(file);
        }

        [Post("login")]
        public IHttpResponseResult AuthPost(string email, string password)
        {
            string connectionString =
                @"Server=localhost; Database=PremierDataBase; User Id=sa; Password=P@ssw0rd;TrustServerCertificate=true;";
            var connection = new SqlConnection(connectionString);
            var dBcontext = new ORMContext<User>(connection);
            var user = dBcontext.ReadByAll($"Email = '{email}' AND Password = '{password}'").FirstOrDefault();

            if (user == null)
            {
                var errText = " Сервер: Пользователь с указанным email не найден или введен неверный пароль.";
                Console.WriteLine(errText);
                return Json(new { success = false, message = "Неверный логин или пароль. Проверьте данные и повторите попытку." });
            }

            string token = Guid.NewGuid().ToString();
            Cookie cookie = new Cookie("session-token", token);
            Context.Response.SetCookie(cookie);
            SessionStorage.SaveSession(token, user.user_id);

            return Json(new { success = true, redirectUrl = "mainpage" }); ;
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