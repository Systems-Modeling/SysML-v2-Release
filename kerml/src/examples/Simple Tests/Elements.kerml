element <e145>;

element <'1.2.4'> MyName;

element <A> {
	doc /* Element A is related to element B. */
	relationship to B;
}

element <B> {
	language "HTML"
		/* <a href="https://plm.elsewhere.com/part?id="1234"/> */
}