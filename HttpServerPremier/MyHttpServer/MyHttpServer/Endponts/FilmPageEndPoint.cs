using HttpServerLibrary.Attributes;
using HttpServerLibrary.Core;
using HttpServerLibrary.HttpResponse;
using MyHttpServer.Models;
using MyHttpServer.Session;
using MyORMLibrary;
using System.Data.SqlClient;
using TemplateEngine.Core.Templaytor;
using TemplateEngine.Models;


namespace MyHttpServer.Endponts
{
    internal class FilmPageEndPoint : BaseEndpoint
    {

        [Get("filmpage")]
        public IHttpResponseResult GetPage(int id)
        {
            var file = File.ReadAllText(@"Templates/Pages/FilmPage/FilmPage.html");
            string connectionString =
                @"Server=localhost; Database=PremierDataBase; User Id=sa; Password=P@ssw0rd;TrustServerCertificate=true;";
            var connection = new SqlConnection(connectionString);
            var dBcontext = new ORMContext<Series>(connection);
            var series = dBcontext.ReadById(id);
            var result = CustomTemplator.GetFilmHtmlWithData(series, file);
            var temp = CustomTemplator.GetHtlmAuthorized(result);
            if (IsAuthorized(Context)) return Html(CustomTemplator.GetFavoritesHtlmAuthorized(temp));
            return Html(result);
        }

        [Get("filmpage/getperson")]
        public IHttpResponseResult GetPersonData(int id)
        {
            string connectionString =
                @"Server=localhost; Database=PremierDataBase; User Id=sa; Password=P@ssw0rd;TrustServerCertificate=true;";
            var connection = new SqlConnection(connectionString);
            var dBcontext = new ORMContext<Person>(connection);
            var person = TemplateHtml(dBcontext.ReadPersonBySeriesId(id));
            return Json(person);
        }

        [Get("filmpage/getepisode")]
        public IHttpResponseResult GetEpisodeData(int id)
        {
            string connectionString =
                @"Server=localhost; Database=PremierDataBase; User Id=sa; Password=P@ssw0rd;TrustServerCertificate=true;";
            var connection = new SqlConnection(connectionString);
            var dBcontext = new ORMContext<Episode>(connection);
            var episode = TemplateEpisodeHtml(dBcontext.ReadEpisodeBySeriesId(id));
            return Json(episode);
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

        public List<string> TemplateHtml(List<Person> personData)
        {
            var result = new List<string>();
            foreach (var person in personData)
            {
                result.Add(CustomTemplator.GetPersonWithData(person));
            }
            return result;
        }

        public List<string> TemplateEpisodeHtml(List<Episode> episodeData)
        {
            var result = new List<string>();
            foreach (var episode in episodeData)
            {
                result.Add(CustomTemplator.GetEpisodeWithData(episode));
            }
            return result;
        }


    }
}
