"use strict";

module.exports = {
	name: "login",

	/**
	 * Service settings
	 */
	settings: {

	},

	/**
	 * Service dependencies
	 */
	dependencies: [],	

	/**
	 * Actions
	 */
	actions: {

        list: {
            handler(ctx) {            
                console.log("}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}]");
              return "GET login list";
            }
          },
      
          get: {
            handler(ctx) {
              return `GET the login with Id = ${ctx.params.id}`;
            }
          },
      
          create: {
            params: {
              title: { type: "string" }
            },
            handler(ctx) {
              return `CREATE login with title = ${ctx.params.title}`;
            }
          },
      
          update: {
            params: {
              title: { type: "string" }
            },
            handler(ctx) {
              return `UPDATE title of login with Id = ${
                ctx.params.id
              }. New title: ${ctx.params.title}`;
            }
          },
      
          remove: {
            handler(ctx) {
              return `DELETE login with Id = ${ctx.params.id}`;
            }
          }
	},

	/**
	 * Events
	 */
	events: {

	},

	/**
	 * Methods
	 */
	methods: {

	},

	/**
	 * Service created lifecycle event handler
	 */
	created() {

	},

	/**
	 * Service started lifecycle event handler
	 */
	started() {

	},

	/**
	 * Service stopped lifecycle event handler
	 */
	stopped() {

	}
};