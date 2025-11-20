using Microsoft.AspNetCore.Hosting;

using Microsoft.AspNetCore.Http;
using System.Net;

using Microsoft.Extensions.Dependency Injection;

using Microsoft.Extensions.Hosting;

using System;

using System.Collections.Generic;

using System.Linq;

using System.Threading.Tasks;

namespace Lab_15_2

{

    public class Startup

    {

        // This method is called by the runtime. Use this method to add services to the container.

        // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=398940

        public void ConfigureServices(IServiceCollection services)

        {

        }

        // This method is called by the runtime. Use this method to configure the HTTP request pipeline.

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)

        {

            if (env.IsDevelopment())

            {

                app.Use DeveloperExceptionPage();

            }

            {

                app.Use Routing();

                app.Use Endpoints(endpoints =>


                endpoints.MapGet("/", async context =>

{

                    await context.Response.WriteAsync("Hello World!");

                });

            });