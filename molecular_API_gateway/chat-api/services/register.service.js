"use strict";

module.exports = {
	name: "register",

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
              return "GET register list";
            }
          },
      
          get: {
            handler(ctx) {
              return `GET the register with Id = ${ctx.params.id}`;
            }
          },
      
          create: {
            params: {
              username: { type: "string" },
              password: { type: "string" }
            },
            handler(ctx) {
              return `CREATE register with username = ${ctx.params.username} password =${ctx.params.password}`;
            }
          },
      
          update: {
            params: {
              title: { type: "string" }
            },
            handler(ctx) {
              return `UPDATE title of register with Id = ${
                ctx.params.id
              }. New title: ${ctx.params.title}`;
            }
          },
      
          remove: {
            handler(ctx) {
              return `DELETE register with Id = ${ctx.params.id}`;
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