If you use the Hiawatha webserver, use the following configuration options:

	StartFile = index.xml
	UseXSLT = yes

For any other webserver, enable PHP execution, make index.php the start file
and rewrite every request for a non-existing file to index.php.
