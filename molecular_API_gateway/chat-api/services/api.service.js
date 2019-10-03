"use strict";

const ApiGateway = require("moleculer-web");

module.exports = {
	name: "api",
	mixins: [ApiGateway],

	// More info about settings: https://moleculer.services/docs/0.13/moleculer-web.html
	settings: {
		port: process.env.PORT || 3000,

		routes: [{
			path: "/api",

			// RESTful aliases
			aliases: {
				"GET register": "register.list",
				"GET register/:id": "register.get",
				"POST register": "register.create",
				"PUT register/:id": "register.update",
				"DELETE register/:id": "register.remove",
				
				"GET login": "login.list",
				"GET login/:id": "login.get",
				"POST login": "login.create",
				"PUT login/:id": "login.update",
				"DELETE login/:id": "login.remove"
			  },

			  
			whitelist: [
				// Access to any actions in all services under "/api" URL
				"**"
			]
		}],

		// Serve assets from "public" folder
		assets: {
			folder: "public"
		}
	}
};
