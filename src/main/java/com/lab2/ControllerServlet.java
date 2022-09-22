package com.lab2;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(value = "/ControllerServlet")
public class ControllerServlet extends HttpServlet {

    @Override
    public void init() {
    }

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
    }

    public void destroy() {
    }
}