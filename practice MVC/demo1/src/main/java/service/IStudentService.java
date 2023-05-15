package service;

import model.Level;
import model.Student;

import java.util.List;

public interface IStudentService {

    List<Student> getList();

    List<Level> getLevelList();

    boolean saveStudent(Student student);
}
