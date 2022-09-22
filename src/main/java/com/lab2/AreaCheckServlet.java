package com.lab2;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@WebServlet("/AreaCheckServlet")
public class AreaCheckServlet extends HttpServlet {

    public AreaCheckServlet() {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer x = parseInt(request.getParameter("x"));
        Float y = parseFloat(request.getParameter("y"));
        Float r = parseFloat(request.getParameter("r"));
        LocalDateTime clientDate = parseDate(request.getParameter("clientDate"));

        if (x != null && y != null && r != null && clientDate != null) {
            HttpSession httpSession = request.getSession();

            TableRow newRow = formNewTableRow(x, y, r, clientDate);

            List<TableRow> tableRows = sessionObjectToArrayList(httpSession.getAttribute("table"));
            tableRows.add(newRow);
            httpSession.setAttribute("table", tableRows);

            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }
    }

    private List<TableRow> sessionObjectToArrayList(Object table) {
        if (table instanceof Collection) {
            return (List<TableRow>) table;
        } else {
            return new ArrayList<>();
        }
    }

    public TableRow formNewTableRow(int x, float y, float r, LocalDateTime clientDate) {
        long currentTime = System.currentTimeMillis();
        boolean isHit = isHitCircle(x, y, r) || isHitRectangle(x, y, r) || isHitTriangle(x, y, r);
        double scriptWorkingTime = System.currentTimeMillis() - currentTime;

        return new TableRow(x, y, r, isHit, clientDate, scriptWorkingTime);
    }

    private boolean isHitCircle(int x, float y, float r) {
        return x <= 0 && y <= 0 && (Math.pow(x, 2) + Math.pow(y, 2) <= Math.pow(r / 2, 2));
    }

    private boolean isHitRectangle(int x, float y, float r) {
        return x >= 0 && x <= r && y <= 0 && y >= -r / 2;
    }

    private boolean isHitTriangle(int x, float y, float r) {
        return x >= 0 && y >= 0 && r - y - x >= 0;
    }

    private Integer parseInt(String value) {
        try {
            return Integer.parseInt(value);
        } catch (NullPointerException | NumberFormatException e) {
            return null;
        }
    }

    private Float parseFloat(String value) {
        try {
            return Float.parseFloat(value);
        } catch (NullPointerException | NumberFormatException e) {
            return null;
        }
    }

    private LocalDateTime parseDate(String value) {
        try {
            return LocalDateTime.parse(value, DateTimeFormatter.ofPattern("dd.MM.yyyy, HH:mm:ss"));
        } catch (NullPointerException | DateTimeParseException e) {
            return null;
        }
    }
}
