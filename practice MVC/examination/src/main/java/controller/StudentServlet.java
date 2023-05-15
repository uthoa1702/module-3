package controller;

import model.Level;
import model.Student;
import service.IStudentService;
import service.impl.StudentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentServlet", value = "/StudentServlet")
public class StudentServlet extends HttpServlet {
    private static IStudentService studentService = new StudentService();
    private static List<Level> levelList = studentService.getLevelList();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                request.setAttribute("levelList", levelList);
                request.getRequestDispatcher("/create.jsp").forward(request, response);
                break;
            case "edit":
                break;
            default:
                List<Student> studentList = studentService.getList();
                request.setAttribute("studentList", studentList);
                request.getRequestDispatcher("/list.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                String name = request.getParameter("name");
                int age = Integer.parseInt(request.getParameter("age"));
                String country = request.getParameter("country");
                int levelId = Integer.parseInt(request.getParameter("levelId"));
                Level level = new Level(levelId);
                Student student = new Student(name, age, country, level);
                boolean check = studentService.saveStudent(student);
                List<Student> studentList = studentService.getList();
                request.setAttribute("studentList", studentList);
                request.setAttribute("check", check);
                request.getRequestDispatcher("/create.jsp").forward(request, response);
                break;
            case "edit":
                break;
            default:
        }
    }
}
