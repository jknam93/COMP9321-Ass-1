package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Checkout
 */
public class CartControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//no 
		if(request.getParameter("id") == null) {
			response.sendRedirect("cart");
		} else  if(request.getParameter("remove") != null ){
			for(String id: request.getParameterValues("id")){
				for(Cookie c: request.getCookies()){
					if(c.getName().equals(id)){
						c.setMaxAge(0);
						response.addCookie(c);
					}
				}
			}              
		    response.sendRedirect("cart"); 
		} else {
			for(String id: request.getParameterValues("id")){
				System.out.println(id);
			}    
			request.getRequestDispatcher("/checkout.jsp").forward(request, response);
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
