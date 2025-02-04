﻿using System.Data;


namespace MyORMLibrary
{
    public class Test1Context<T> where T : class, new()
    {
        private readonly IDbConnection _dbConnection;

        public Test1Context(IDbConnection dbConnection)
        {
            _dbConnection = dbConnection;
        }

        public T GetById(int id)
        {
            string query = $"SELECT * FROM {typeof(T).Name}s WHERE Id = @Id"; 


            _dbConnection.Open();

            using (var command = _dbConnection.CreateCommand())
            {
                command.CommandText = query;
                var parametr = command.CreateParameter();
                parametr.ParameterName = "@id";
                parametr.Value = id;

                using (var reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        return Map(reader);
                    }
                }
            }
            return null;
        }

        private T Map(IDataReader reader)
        {
            var entity = new T();
            var properties = typeof(T).GetProperties();

            foreach (var property in properties)
            {
                if (reader[property.Name] != DBNull.Value)
                {
                    property.SetValue(entity, reader[property.Name]);
                }
            }

            return entity;
        }


        /*
         * var parameter = command.CreateParameter();
                parameter.ParameterName = "@Id";
                parameter.Value = id;
                command.Parameters.Add(parameter);

        */
    }
}
