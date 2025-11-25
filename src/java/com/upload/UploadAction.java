/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upload;

import com.database.Dbconnection;
import com.database.Queries;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author KishanVenky
 */
@MultipartConfig(maxFileSize=16*1024*1024)
public class UploadAction extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       try{
           HttpSession session=request.getSession();
           String sid=request.getParameter("sid");
           String sname=request.getParameter("sname");
            String carid=request.getParameter("carid");
           String company=request.getParameter("company");
           String variant=request.getParameter("variant");
           String type=request.getParameter("type");
          
           String exshowroomprice=request.getParameter("exshowroomprice");
           String rto=request.getParameter("rto");
           String Insurance=request.getParameter("Insurance");
           
           Part image=request.getPart("image");
           InputStream in=image.getInputStream();
           
           
           Connection con=Dbconnection.getcon();
           ResultSet r=Queries.getExecuteQuery("select count(*) from pricing where company='"+company+"'and variant='"+variant+"'");
           int cc=0;
           while(r.next()){
            cc=r.getInt(1);   
           }
           if(cc==0){
           PreparedStatement pst=con.prepareStatement("insert into pricing values('"+carid+"','"+company+"','"+variant+"','"+type+"','"+exshowroomprice+"','"+rto+"','"+Insurance+"',?,'"+sid+"','"+sname+"')");
           pst.setBlob(1, in);
           int i=pst.executeUpdate();
           
           if(i>0)
           {
              
               session.setAttribute("carid",carid);
               response.sendRedirect("UploadMaintenance.jsp?msg=success");
           }else{
               response.sendRedirect("AddCarDetails.jsp?msg=Failed");
           }
           }else{
              response.sendRedirect("AddCarDetails.jsp?msg=Already Exist");   
           }
       }catch(Exception e){
           System.out.println(e);
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
