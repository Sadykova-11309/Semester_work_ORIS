using System.Net;

namespace HttpServerLibrary.HttpResponse
{
    public interface IHttpResponseResult
    {
        HttpStatusCode StatusCode { get; }

        void Execute(HttpListenerResponse response);
    }

    public class HttpResponseResult : IHttpResponseResult
    {
        public HttpStatusCode StatusCode { get; }

        public HttpResponseResult(HttpStatusCode statusCode)
        {
            StatusCode = statusCode;
        }

        public void Execute(HttpListenerResponse response)
        {
            throw new NotImplementedException();
        }
    }
}
