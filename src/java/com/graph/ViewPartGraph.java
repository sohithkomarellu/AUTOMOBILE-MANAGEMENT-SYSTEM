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
public class ViewPartGraph extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
          OutputStream out = response.getOutputStream();
    	   DefaultCategoryDataset bar_chart_servlet = new DefaultCategoryDataset();
        try{
             HttpSession session=request.getSession();
           String cardid=(String)session.getAttribute("cardid");
           String part=(String)session.getAttribute("part");
           
           Queries.getExecuteUpdate("delete from part_graph");
           
           
           
            ResultSet r=Queries.getExecuteQuery("select * from partchange where carid='"+cardid+"' and service='"+part+"'");
            String engine_oil=null;
            String Oil_filter=null;
            String air_filter=null;
             String coolent=null;
              String fuel_filter=null;
               String service_charge=null;
                String spark_plug=null;
                 String brake_clutch_oil=null;
           while(r.next()){
                engine_oil=r.getString("engine_oil");
               
                 Oil_filter=r.getString("Oil_filter");
                air_filter=r.getString("air_filter");
                 coolent=r.getString("Coolant");
                fuel_filter=r.getString("fuel_filter");
                 service_charge=r.getString("service_charge");
                spark_plug=r.getString("spark_plug");
                 brake_clutch_oil=r.getString("brake_clutch_oil");
               
           }
               Queries.getExecuteUpdate("insert into part_graph values('engine_oil','"+engine_oil+"')");
              Queries.getExecuteUpdate("insert into part_graph values('Oil_filter','"+Oil_filter+"')");
               Queries.getExecuteUpdate("insert into part_graph values('air_filter','"+air_filter+"')");
          
                Queries.getExecuteUpdate("insert into part_graph values('Coolent','"+coolent+"')");
              Queries.getExecuteUpdate("insert into part_graph values('fuel_filter','"+fuel_filter+"')");
               Queries.getExecuteUpdate("insert into part_graph values('service_charge','"+service_charge+"')");
               
                Queries.getExecuteUpdate("insert into part_graph values('spark_plug','"+spark_plug+"')");
               Queries.getExecuteUpdate("insert into part_graph values('brake_clutch_oil','"+brake_clutch_oil+"')");
                   
             ResultSet rr=Queries.getExecuteQuery("select * from part_graph");
        while(rr.next()){
            String name=rr.getString("name");
            int price=Integer.parseInt(rr.getString("count"));
            
            bar_chart_servlet.addValue(price,"", name); 
        }
           
           
           
           
        }catch(Exception e){
            System.out.println(e);
        }
        JFreeChart BarChartObject=ChartFactory.createBarChart("Analysis","","Price",bar_chart_servlet,PlotOrientation.HORIZONTAL.HORIZONTAL.VERTICAL,true,true,false); 
                response.setContentType("image/png");
                ChartUtilities.writeChartAsPNG(out, BarChartObject, 1080, 400);
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
