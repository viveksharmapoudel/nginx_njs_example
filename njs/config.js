function hello_world(r) {
	r.return(200, "Hello World!\n");
}

function verified_route(r) {
	r.return(200, "This route is verified!\n");
}

//simple function to verify token
//here nothing is encrypted yet
async function verify(r) {
	try {
		const token = r.headersIn.token;

		if (!token) {
			r.error("No Token Provided");
			r.return(400);
			return;
		}

		if (token === "this_is_secret") {
			r.return(200);
			return;
		}
		r.return(400);
	} catch (e) {
		r.error(e);
		r.return(500);
		return;
	}
}

export default { hello_world, verified_route, verify };
