using MyHttpServer.Models;
using TemplateEngine.Models;

namespace TemplateEngine.Core.Templaytor
{
    public class CustomTemplator : ICustomTemplator
    {

        // template = <h1>name</h1>
        // name = Тимерхан

        public string GetHtmlByTemplate(string template, string name)
        {
            return template.Replace("{name}", name);
        }


        public string GetHtmlByTemplate<T>(string template, T obj)
        {
            // Логика: проходится по всем свойствам T и проверять их наличие в виде переменной в template. 
            // Если нашлось, произвоить замену.

            return template;
        }

        public static string GetHtmlWithData(Series series)
        {
            return $@"<a href=""filmpage?id={series.series_id}"">
            <img class=""content-serial-image"" src=""{series.poster_url}"">
            <div class = ""content-serial-name"">
                {series.title}
            </div></a>";
        }

        public static string GetHtlmAuthorized(string? template)
        {
            string before = """"<a href="login"> <button class = "header-content-auth" > Войти </button> </a>"""";
            string after = """"<a href="admin"> <img class="header-content-auth-on" src="/MainPage/images/Authorized.png"></a>"""";
            return template.Replace(before, after);
        }

        public static string GetFavoritesHtlmAuthorized(string? template)
        {
            string before = """"<button class="watch-button"> Смотреть </button> <button class="favorites-button-off"> Add </button>"""";
            string after = """"
                <div class="main-buttons">
                <button class="watch-button"> Смотреть </button>
                <button class="favorites-button-on">
                    <img class="favorites-button-on-img" id="favorites-icon" src="FilmPage/images/favoff.png" alt="Добавить в избранное">
                </button>
                </div>
                """";
            return template.Replace(before, after);
        }

        public static string GetFilmHtmlWithData(Series series, string template)
        {
            template = template.Replace("{{title}}", series.title);
            template = template.Replace("{{poster_url}}", series.poster_url);
            template = template.Replace("{{logo_url}}", series.logo_url);
            template = template.Replace("{{year}}", series.year.ToString());
            template = template.Replace("{{description}}", series.description);
            template = template.Replace("{{rating}}", series.rating.ToString());
            template = template.Replace("{{genre}}", series.genre);
            template = template.Replace("{{country}}", series.country);
            template = template.Replace("{{plot}}", series.plot);
            return template;
        }

        public static string GetPersonWithData(Person person)
        {
            return $@"
                <img class=""cast-image"" src=""{person.photo_url}"">
                <span class=""cast-name"">{person.first_name}</span>
                <span class=""cast-name"">{person.last_name}</span>
                <span class=""cast-profession"">{person.role}</span>";
        }

        public static string GetEpisodeWithData(Episode episode)
        {
            return $@"
                <img class=""episodes-episode-image"" src=""{episode.logo_url}"" alt=""episode"">
                <div class = ""episodes-episode-name"">
                    {episode.episode_number} серия
                </div>";
        }


    }
}
