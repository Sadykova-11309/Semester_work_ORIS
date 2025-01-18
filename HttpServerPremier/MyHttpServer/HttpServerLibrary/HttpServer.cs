﻿using HttpServerLibrary.Core;
using HttpServerLibrary.Handlers;
using System.Net;

namespace HttpServerLibrary
{
    /// <summary>
    /// HTTP-сервер, который обслуживает статические файлы и обрабатывает запросы для отправки электронных писем.
    /// </summary>
    public class HttpServer
    {
        private readonly StaticFilesHandler _staticFilesHandler; // Обработчик для обслуживания статических файлов.
        private readonly EndpointsHandler _endpointsHandler; // Обработчик для пользовательских конечных точек
        private readonly HttpListener _listener; // Создает экземпляр HttpListener для прослушивания HTTP-запросов.

        /// <summary>
        /// Инициализирует новый экземпляр класса HttpServer/>.
        /// </summary>
        public HttpServer(string[] prefixex)
        {
            _listener = new HttpListener(); // Создает новый экземпляр HttpListener.
            foreach (var prefix in prefixex) // Проходит по предоставленным префиксам.
            {
                Console.WriteLine($"Сервер запущен: {prefix}");
                _listener.Prefixes.Add(prefix); // Добавляет каждый префикс в HttpListener. Это определяет URL-адреса, которые будет прослушивать сервер.
            }
            _staticFilesHandler = new StaticFilesHandler(); // Создает новый экземпляр StaticFilesHandler.
            _endpointsHandler = new EndpointsHandler(); // Создает новый экземпляр EndpointsHandler.
        }


        /// <summary>
        /// Асинхронно запускает HTTP-сервер.
        /// </summary>
        public async Task StartAsync()
        {
            _listener.Start(); // Начинает прослушивание входящих запросов.
            while (_listener.IsListening) // Продолжает прослушивание, пока прослушиватель активен.
            {
                var context = await _listener.GetContextAsync(); // Ожидает входящий запрос и получает контекст.
                var httpRequestContext = new HttpRequestContext(context); // Создает объект HttpRequestContext, оборачивающий HttpListenerContext.
                await ProcessRequestAsync(httpRequestContext); // Асинхронно обрабатывает запрос.
            }
        }

        // <summary>
        /// Асинхронно обрабатывает один HTTP-запрос.
        /// </summary>
        private async Task ProcessRequestAsync(HttpRequestContext context)
        {
            _staticFilesHandler.Successor = _endpointsHandler; // Устанавливает цепочку ответственности: StaticFilesHandler
                                                               // сначала обрабатывает запросы, а затем при необходимости
                                                               // передает их в EndpointsHandler.
            _staticFilesHandler.HandleRequest(context); // Начинает обработку запроса, вызывая метод HandleRequest первого обработчика в цепочке.

        }

        /// <summary>
        /// Останавливает HTTP-сервер.
        /// </summary>
        private void Stop()
        {
            _listener.Stop(); // Останавливает прослушивание входящих запросов.
            Console.WriteLine("Server closed"); // Выводит сообщение на консоль.
        }
    }

}
