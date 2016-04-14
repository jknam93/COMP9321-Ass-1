<table class="table table-striped">
	<thead>
		<tr>
			<th>Title</th>
			<th>Album Title</th>
			<th>Artist</th>
			<th>Genre</th>
			<th>Publisher</th>
			<th>Year</th>
			<th>Price</th>
			<th>Add</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="item" items="${songs}">
			<c:set var="artist"
				value="${item.getChildNodes().item(1).getTextContent()}" />
			<c:set var="title"
				value="${item.getChildNodes().item(3).getTextContent()}" />
			<c:set var="genre"
				value="${item.getParentNode().getChildNodes().item(7).getTextContent()}" />
			<c:set var="publisher"
				value="${item.getParentNode().getChildNodes().item(9).getTextContent()}" />
			<c:set var="year"
				value="${item.getParentNode().getChildNodes().item(11).getTextContent()}" />
			<c:set var="price"
				value="${item.getChildNodes().item(7).getTextContent()}" />
			<c:set var="id"
				value="${item.getChildNodes().item(9).getTextContent()}" />
			<c:set var="albumTitle"
				value="${item.getParentNode().getChildNodes().item(3).getTextContent()}" />
			<c:set var="albumID"
				value="${item.getParentNode().getChildNodes().item(5).getTextContent()}" />

			<tr>
				<th>${title}</th>
				<th>${albumTitle}</th>
				<th>${artist}</th>
				<th>${genre}</th>
				<th>${publisher}</th>
				<th>${year}</th>
				<th><fmt:formatNumber value="${price}" type="CURRENCY" /></th>
				<th><input type="checkbox" name="id" value="${id}" id="${id }" onclick="checkDuplicates('${id}');checkAlbum('${id}', '${albumID}')"></th>
			</tr>
		</c:forEach>
	</tbody>
</table>