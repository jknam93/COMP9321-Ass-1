package beans;

import java.util.*;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;

public class SearchBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private Document doc;
	

	public SearchBean () throws SAXException, IOException{
		String path = "WEB-INF/musicDb.xml";
		try {

			File inputFile = new File(path);
			DocumentBuilderFactory dbFactory 
	        = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder;
			dBuilder = dbFactory.newDocumentBuilder();
	        this.doc = dBuilder.parse(inputFile);

		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public ArrayList<Node> searchArtists(String query){
		NodeList nodes = doc.getElementsByTagName("artist");
		ArrayList<Node> ret = new ArrayList<Node>();
		for(int i = 0; i <= nodes.getLength() - 1;i++){
			String artist = nodes.item(i).getTextContent().toLowerCase();
			if(artist.contains(query.toLowerCase())){
				ret.add(nodes.item(i).getParentNode());
			}
		}
		return ret;
	}
	public ArrayList<Node> searchAlbums(String query) {
		NodeList albums = doc.getElementsByTagName("albumList");
		ArrayList<Node> ret = new ArrayList<Node>();

		for (int i = 0; i <= albums.getLength() - 1; i++) {
			NodeList details = albums.item(i).getChildNodes();
			for (int j = 1; j <= details.getLength() - 1; j+=2) {
				Node detail = details.item(j);
				if (detail.getNodeName().equals("songList")) {
					break;
				} else {
					String value = detail.getTextContent().toLowerCase();
					if (value.contains(query.toLowerCase())) {
						ret.add(albums.item(i));
						break;
					}
				}
			}
		}
		return ret;
	}

	public ArrayList<Node> searchSongs(String query) {

		NodeList songs = doc.getElementsByTagName("songList");
		ArrayList<Node> ret = new ArrayList<Node>();

		for (int i = 0; i <= songs.getLength() - 1; i++) {
			NodeList details = songs.item(i).getChildNodes();
			for (int j = 1; j <= details.getLength() - 1; j+=2) {
				Node detail = details.item(j);
				String value = detail.getFirstChild().getTextContent().toLowerCase();
				if (value.contains(query.toLowerCase())) {
					ret.add(songs.item(i));
				}
			}
		}
		return ret;
	}

	public ArrayList<Node> searchAll(String query) {
		
		ArrayList<Node> ret = new ArrayList<Node>();
		ret.addAll(this.searchAlbums(query));
		ret.addAll(this.searchSongs(query));

		return ret;
	}

	public ArrayList<Node> random(int n) {
		NodeList songs = doc.getElementsByTagName("songList");
		ArrayList<Node> ret = new ArrayList<Node>();
		int numSongs = songs.getLength();
		Random rng = new Random(System.currentTimeMillis());
		int i = 0;
		while (i != n) {
			Node song = songs.item(rng.nextInt(numSongs) % numSongs);
			if (!ret.contains(song)) {
				ret.add(song);
				i++;
			}
		}
		return ret;
	}
	public Node searchByID(String id){

		NodeList album = doc.getElementsByTagName("ID");
		for(int i = 0; i <= album.getLength() - 1; i++){
			if(album.item(i).getTextContent().equals(id)){
				return album.item(i).getParentNode();
			}
		}
		NodeList songs = doc.getElementsByTagName("songID");
		for(int i = 0; i <= songs.getLength() - 1; i++){
			if(songs.item(i).getTextContent().equals(id)){
				return songs.item(i).getParentNode();
			}
		}
		return null;
	}
}
