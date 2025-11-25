/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.graph;

import com.database.Queries;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;

/**
 *
 * @author KishanVenky
 */
public class ViewServiceGraph extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        OutputStream out = response.getOutputStream();
    	   DefaultCategoryDataset bar_chart_servlet = new DefaultCategoryDataset();
        try{
              
       HttpSession session=request.getSession();
           String cardid=(String)session.getAttribute("cardid");
           String service=(String)session.getAttribute("service");
          
           
           Queries.getExecuteUpdate("delete from service_graph");
           
           
           
            ResultSet r=Queries.getExecuteQuery("select * from service where carid='"+cardid+"'");
            
            
           while(r.next()){
              String  total=r.getString("total");
            
             Queries.getExecuteUpdate("insert into service_graph values('"+service+"','"+total+"')");   
           }
              
             
          
                    
           
        ResultSet rr=Queries.getExecuteQuery("select * from service_graph");
        while(rr.next()){
            String name=rr.getString("name");
            int price=Integer.parseInt(rr.getString("count"));
            
            bar_chart_servlet.addValue(price,"", name); 
        }
        }catch(Exception e){
           System.out.println(e); 
        }
        JFreeChart BarChartObject=ChartFactory.createBarChart("Service wise Price Analysis","","Price",bar_chart_servlet,PlotOrientation.HORIZONTAL.HORIZONTAL.VERTICAL,true,true,false); 
                response.setContentType("image/png");
                ChartUtilities.writeChartAsPNG(out, BarChartObject, 580, 400);
        
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
