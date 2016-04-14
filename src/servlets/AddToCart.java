package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.xml.sax.SAXException;

import beans.SearchBean;

/**
 * Servlet implementation class Control
 */
@WebServlet("/Control")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			SearchBean search = new SearchBean();
			for(String id: request.getParameterValues("id")){
				boolean addCookie = true;
				for(Cookie c: request.getCookies()){
					if(c.getValue().equals(id)){
						Integer value = Integer.parseInt(c.getValue());
						value++;
						c.setValue(value.toString());
						addCookie = false;
						break;
					}
				}
				if(addCookie == true){
					Cookie freshCookie = new Cookie(id, "1");
					response.addCookie(freshCookie);
				}
			}
	                                                       
		    response.sendRedirect("cart"); 
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
