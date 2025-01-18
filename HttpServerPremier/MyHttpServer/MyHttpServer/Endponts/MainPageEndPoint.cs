using HttpServerLibrary.Attributes;
using HttpServerLibrary.Core;
using HttpServerLibrary.HttpResponse;
using MyHttpServer.Models;
using MyHttpServer.Session;
using MyORMLibrary;
using System.Data.SqlClient;
using TemplateEngine.Core.Templaytor;

namespace MyHttpServer.Endponts
{
    internal class MainPageEndPoint : BaseEndpoint
    {
        [Get("mainpage")]
        public IHttpResponseResult GetPage()
        {
            string connectionString =
                @"Server=localhost; Database=PremierDataBase; User Id=sa; Password=P@ssw0rd;TrustServerCertificate=true;";
            var connection = new SqlConnection(connectionString);
            var dBcontext = new ORMContext<Series>(connection);
            var file = File.ReadAllText(@"Templates/Pages/MainPage/MainPage.html");
            if (IsAuthorized(Context)) return Html(CustomTemplator.GetHtlmAuthorized(file));
            return Html(file);
        }


        [Get("mainpage/getfilms")]
        public IHttpResponseResult GetSeriesData()
        {
            string connectionString =
                @"Server=localhost; Database=PremierDataBase; User Id=sa; Password=P@ssw0rd;TrustServerCertificate=true;";
            var connection = new SqlConnection(connectionString);
            var dBcontext = new ORMContext<Series>(connection);
            var series = TemplateHtml(dBcontext.GetSeriesData());
            return Json(series);
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

        public List<string> TemplateHtml(List<Series> seriesData)
        {
            var result = new List<string>();
            foreach (var series in seriesData)
            {
                result.Add(CustomTemplator.GetHtmlWithData(series));
            }
            return result;
        }
    }
}
