<jsp:useBean id="search" class="beans.SearchBean"
	scope="session" />
	
<h3>Results</h3>
<form method="GET" action="checkOut">
	<%
		int i = 0;
		String modifier = request.getParameter("a");
		String query = request.getParameter("q");
		ArrayList<org.w3c.dom.Node> nodes;
		if (modifier.equals("1")) {
			nodes = search.searchAlbums(query);
		} else if (modifier.equals("2")) {
			nodes = search.searchArtists(query);
		} else if (modifier.equals("3")) {
			nodes = search.searchSongs(query);
		} else {
			nodes = search.searchAll(query);
		}
		if (nodes.isEmpty()) {
			out.println("No results");
			return;
		}
		out.println("<table class=\"table table-striped\">");
		out.println("<thread>");
		out.println("<tr>");
		out.println("<th>Title</th>");
		out.println("<th>Artist</th>");
		out.println("<th>Genre</th>");
		out.println("<th>Publisher</th>");
		out.println("<th>Year</th>");
		out.println("<th>Price</th>");
		out.println("<th>Add</th>");
		out.println("</tr>");
		out.println("</thead>");
		out.println("<tbody>");
		for (org.w3c.dom.Node node : nodes) {
			String title;
			String artist;
			String genre;
			String publisher;
			String year;
			String price;
			String id;

			if (node.getNodeName().equals("songList")) {
				title = node.getChildNodes().item(3).getTextContent();
				artist = node.getChildNodes().item(1).getTextContent();
				genre = node.getParentNode().getChildNodes().item(7).getTextContent();
				publisher = node.getParentNode().getChildNodes().item(9).getTextContent();
				year = node.getParentNode().getChildNodes().item(11).getTextContent();
				price = node.getChildNodes().item(7).getTextContent();
				id = node.getChildNodes().item(9).getTextContent();

			} else {
				title = node.getChildNodes().item(3).getTextContent();
				artist = node.getChildNodes().item(1).getTextContent();
				genre = node.getChildNodes().item(7).getTextContent();
				publisher = node.getChildNodes().item(9).getTextContent();
				year = node.getChildNodes().item(11).getTextContent();
				price = node.getLastChild().getPreviousSibling().getTextContent();
				id = node.getChildNodes().item(5).getTextContent();

			}
			out.println("<tr>");
			out.println("<th>" + title + "</th>");
			out.println("<th>" + artist + "</th>");
			out.println("<th>" + genre + "</th>");
			out.println("<th>" + publisher + "</th>");
			out.println("<th>" + year + "</th>");
			out.println("<th>$" + price + "0</th>");
			out.println("<th><input type=\"checkbox\" name=\"id\" value=\"" + id + "\"></th>");
			out.println("</tr>");
			i++;
		}
		out.println("</tbody>");
		out.println("</table>");
		out.println("<button class=\"btn btn-default\" action=\"submit\">Add to Cart</button>");
	%>
</form>