package com.lab2;

import org.json.JSONArray;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(value = "/ControllerServlet")
public class ControllerServlet extends HttpServlet {

    @Override
    public void init() {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        addTableToSessionIfNotExist(request);
        if (request.getParameter("x") != null && request.getParameter("y") != null
                && request.getParameter("r") != null && request.getParameter("clientDate") != null) {
            getServletContext().getRequestDispatcher("/AreaCheckServlet").forward(request, response);
        }
    }

    private void addTableToSessionIfNotExist(HttpServletRequest request) {
        HttpSession httpSession = request.getSession();
        if (httpSession.getAttribute("table") == null) httpSession.setAttribute("table", new ArrayList<>());
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().setAttribute("table", new ArrayList<>());
        response.setStatus(HttpServletResponse.SC_OK);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        addTableToSessionIfNotExist(request);

        JSONArray array = new JSONArray((List<TableRow>)request.getSession().getAttribute("table"));

        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().println(array);
    }

    public void destroy() {
    }
}