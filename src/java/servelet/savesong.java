/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servelet;

import entity.Songs;
import helper.FactoryProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author shahz
 */
@MultipartConfig
public class savesong extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
          
            
		String cate=request.getParameter("cate");
		String lang=request.getParameter("lang");
		String art=request.getParameter("art");
		String sname=request.getParameter("sname");
		Part song=request.getPart("song");
		Part thumb=request.getPart("thum");
		
		
		Songs s=new Songs();
		s.setCategory(cate);
		s.setArtist(art);
		s.setLanguage(lang);
		s.setSongName(sname);
		s.setSong(song.getSubmittedFileName());
		s.setThumb(thumb.getSubmittedFileName());
		
		
		SessionFactory f=FactoryProvider.getFactory();
		Session ss=f.openSession();
		Transaction t=ss.beginTransaction();
		ss.save(s);
		
		t.commit();
	    ss.close();
	
	    
	    
String path=request.getRealPath("img")+File.separator+"musics"+File.separator+song.getSubmittedFileName();
		
 		

		FileOutputStream fo=new FileOutputStream(path);
		InputStream in=song.getInputStream();
		
		byte[] data=new byte[in.available()];
		
		in.read(data);
		fo.write(data);
		
		fo.close();
		
		
		String pat=request.getRealPath("img")+File.separator+"musics"+File.separator+thumb.getSubmittedFileName();
		
		 out.println(pat);
		FileOutputStream fos=new FileOutputStream(pat);
		InputStream inn=thumb.getInputStream();
		
		byte[] dat=new byte[inn.available()];
		
		inn.read(dat);
		fos.write(dat);
		
		fos.close();
	    
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
