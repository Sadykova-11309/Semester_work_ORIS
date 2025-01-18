﻿using System.Net;
using System.Text;
using System.Text.Json;

namespace HttpServerLibrary.HttpResponse
{
    public class JsonResult : IHttpResponseResult
    {
        private readonly object _data;

        public JsonResult(object data)
        {
            _data = data;
        }

        public HttpStatusCode StatusCode => throw new NotImplementedException();

        public void Execute(HttpListenerResponse response)
        {
            response.Headers.Add("Content-Type", "application/json");
            var json = JsonSerializer.Serialize(_data);
            byte[] buffer = Encoding.UTF8.GetBytes(json);
            response.ContentLength64 = buffer.Length;
            using Stream output = response.OutputStream;
            output.Write(buffer);
            output.Flush();
        }
    }

}
