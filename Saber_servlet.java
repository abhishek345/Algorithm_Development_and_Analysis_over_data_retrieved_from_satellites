/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import matlabcontrol.MatlabProxy;
import matlabcontrol.MatlabProxyFactory;
import matlabcontrol.MatlabProxyFactoryOptions;

/**
 *
 * @author Rishabh
 */
public class Saber_servlet extends HttpServlet {

    public String action,lat1,long1,checked,selectedItem,year,year1,monthname,day,linkname,plotpath,plotname;
    public String dob,filename="",savename,saveplot;
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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            //out.println("<title>Servlet Saber</title>");            
            out.println("</head>");
            out.println("<body>");
            //out.println("<h1>Servlet Saber at " + request.getContextPath() + "</h1>");
            action = request.getParameter("action");
            lat1 = request.getParameter("latitude");
            long1 = request.getParameter("longitude");
            checked = request.getParameter("date");
            selectedItem=request.getParameter("dropdown_parameter");
            plotname=request.getParameter("dropdown_plot");
            switch(checked)
            {
                case "interyearly":
                    year=request.getParameter("selectyear");
                    year1=request.getParameter("selectyear1");
                    linkname="save_ascii/saber/SABER_"+year+"_"+year1+"_"+selectedItem+"_"+lat1+"_"+long1+".txt";
                    plotpath="images/saber/SABER_"+year+"_"+year1+"_"+selectedItem+"_"+lat1+"_"+long1+"_"+plotname+".png";
                    break;
                case "yearly":
                    year=request.getParameter("selectyear");
                    linkname="save_ascii/saber/SABER_"+year+"_"+selectedItem+"_"+lat1+"_"+long1+".txt";
                    plotpath="images/saber/SABER_"+year+"_"+selectedItem+"_"+lat1+"_"+long1+"_"+plotname+".png";
                    break;
                case "monthly":
                    year=request.getParameter("selectyear");
                    monthname=request.getParameter("selectmonth");
                    linkname="save_ascii/saber/SABER_"+monthname+year+"_"+selectedItem+"_"+lat1+"_"+long1+".txt";
                    plotpath="images/saber/SABER_"+monthname+year+"_"+selectedItem+"_"+lat1+"_"+long1+"_"+plotname+".png";
                    break;
                case "daily":
                    year=request.getParameter("selectyear");
                    monthname=request.getParameter("selectmonth");
                    day=request.getParameter("selectday");
                    linkname="save_ascii/saber/SABER_"+monthname+year+"_"+day+"_"+selectedItem+"_"+lat1+"_"+long1+".txt";
                    plotpath="images/saber/SABER_"+monthname+year+"_"+day+"_"+selectedItem+"_"+lat1+"_"+long1+"_"+plotname+".png";
                    break;
            }
            File f=new File("C:/Users/Karthik/Documents/NetBeansProjects/PRL_project/web/"+linkname);
            File f1=new File("C:/Users/Karthik/Documents/NetBeansProjects/PRL_project/web/"+plotpath);
            if(f.exists() && f1.exists())
            {
                if("Plot Data".equals(action))
                {
                    response.sendRedirect("plot_sat.html?"+plotpath+"#"+linkname);
                }
                else if("Save ASCII".equals(action))
                {
                    response.sendRedirect("save_sat.html?"+plotpath+"#"+linkname);
                }
            }
            else
            {
                switch(selectedItem)
                {
                    case "ozone":
                        dob = "SABER Ozone Mixing Ratio ";
                        break;
                    case "temperature":
                        dob = "SABER Temperature Values ";
                        break;
                }
                switch(checked)
                {
                    case "interyearly":
                        dob = dob + "from "+year+" to "+year1;
                        savename = "C:/Users/Karthik/Documents/NetBeansProjects/PRL_project/web/save_ascii/saber/SABER_"+year+"_"+year1+"_"+selectedItem+"_"+lat1+"_"+long1+".txt";
                        saveplot = "C:/Users/Karthik/Documents/NetBeansProjects/PRL_project/web/images/saber/SABER_"+year+"_"+year1+"_"+selectedItem+"_"+lat1+"_"+long1+"_"+plotname+".png";
                        break;
                    case "yearly":
                        dob = dob + "of "+year;
                        savename = "C:/Users/Karthik/Documents/NetBeansProjects/PRL_project/web/save_ascii/saber/SABER_"+year+"_"+selectedItem+"_"+lat1+"_"+long1+".txt";
                        saveplot = "C:/Users/Karthik/Documents/NetBeansProjects/PRL_project/web/images/saber/SABER_"+year+"_"+selectedItem+"_"+lat1+"_"+long1+"_"+plotname+".png";
                        break;
                    case "monthly":
                        dob = dob + "of "+monthname+", "+year;
                        filename = "C:/Users/Karthik/Documents/Data/SABER/SABER_Temp_O3_"+monthname+year+"_v2.0.nc";
                        savename = "C:/Users/Karthik/Documents/NetBeansProjects/PRL_project/web/save_ascii/saber/SABER_"+monthname+year+"_"+selectedItem+"_"+lat1+"_"+long1+".txt";
                        saveplot = "C:/Users/Karthik/Documents/NetBeansProjects/PRL_project/web/images/saber/SABER_"+monthname+year+"_"+selectedItem+"_"+lat1+"_"+long1+"_"+plotname+".png";
                        break;
                    case "daily":
                        dob = dob + "on "+day+" "+monthname+", "+year;
                        filename = "C:/Users/Karthik/Documents/Data/SABER_Daily/SABER_Temp_O3_"+monthname+year+"_"+day+"_v2.0.nc";
                        savename = "C:/Users/Karthik/Documents/NetBeansProjects/PRL_project/web/save_ascii/saber/SABER_"+monthname+year+"_"+day+"_"+selectedItem+"_"+lat1+"_"+long1+".txt";
                        saveplot = "C:/Users/Karthik/Documents/NetBeansProjects/PRL_project/web/images/saber/SABER_"+monthname+year+"_"+day+"_"+selectedItem+"_"+lat1+"_"+long1+"_"+plotname+".png";
                        break;
                }
                //Matlab
                final Long MATLAB_PROXY_TIMEOUT = 200000L;
                MatlabProxyFactoryOptions.Builder builder = new MatlabProxyFactoryOptions.Builder()
                                                            .setHidden(true)
                                                            .setUsePreviouslyControlledSession(true)
                                                            .setProxyTimeout(MATLAB_PROXY_TIMEOUT);
                MatlabProxyFactory factory = new MatlabProxyFactory(builder.build());
                //get the proxy
                try
                {
                    MatlabProxy proxy = factory.getProxy();
                    proxy.eval("clear");
                    proxy.eval("clc");
                    proxy.setVariable("lat_input", Float.parseFloat(lat1));
                    proxy.setVariable("long_input", Float.parseFloat(long1));
                    proxy.setVariable("parameter", selectedItem);
                    proxy.setVariable("filename", filename);
                    proxy.setVariable("dob", dob);
                    proxy.setVariable("saveplot", saveplot);
                    proxy.setVariable("savename", savename);
                    proxy.setVariable("year1", year);
                    proxy.setVariable("year2", year1);
                    proxy.eval("run('C:/Users/Karthik/Documents/NetBeansProjects/PRL_project/extras/saber_"+checked+"_"+plotname+".m');");
                    proxy.disconnect();
                    if("Plot Data".equals(action))
                    {
                        //Thread.currentThread().sleep(2000);
                        response.sendRedirect("plot_sat.html?"+plotpath+"#"+linkname);
                    }
                    else if("Save ASCII".equals(action))
                    {
                        //Thread.currentThread().sleep(2000);
                        response.sendRedirect("save_sat.html?"+plotpath+"#"+linkname);
                    }
                }
                catch(Exception e)
                {
                    out.println(e);
                }
                //out.println("executed");
            }
            out.println("</body>");
            out.println("</html>");
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